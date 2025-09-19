'use client'

import { useConnection, useWallet } from '@solana/wallet-adapter-react'
import { LAMPORTS_PER_SOL, PublicKey, SystemProgram, Transaction, TransactionInstruction } from '@solana/web3.js'
import { useState, useMemo } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Button } from '@/components/ui/button'
import { useTransactionToast } from '@/components/use-transaction-toast'
import { ExplorerLink } from '@/components/cluster/cluster-ui'
import Image from 'next/image'
import { WalletButton } from '@/components/solana/solana-provider'

const FISH_ADDRESS = 'GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd'
const MEMO_PROGRAM_ID = new PublicKey('MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr')

export default function MemoFeature() {
  const { connection } = useConnection()
  const { publicKey, signTransaction } = useWallet()
  const [amountSol, setAmountSol] = useState('0.001')
  const [memo, setMemo] = useState('Hello fish!')
  const [sending, setSending] = useState(false)
  const transactionToast = useTransactionToast()

  const fishPubkey = useMemo(() => new PublicKey(FISH_ADDRESS), [])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!publicKey || !signTransaction) return

    try {
      setSending(true)
      const lamports = Math.floor(parseFloat(amountSol || '0') * LAMPORTS_PER_SOL)
      if (!Number.isFinite(lamports) || lamports <= 0) throw new Error('Enter a valid SOL amount')

      const ixTransfer = SystemProgram.transfer({ fromPubkey: publicKey, toPubkey: fishPubkey, lamports })
      const ixMemo = new TransactionInstruction({
        keys: [{ pubkey: publicKey, isSigner: true, isWritable: false }],
        programId: MEMO_PROGRAM_ID,
        data: Buffer.from(memo ?? '', 'utf8'),
      })

      const latest = await connection.getLatestBlockhash('confirmed')
      const tx = new Transaction({ feePayer: publicKey, ...latest }).add(ixTransfer, ixMemo)
      const signed = await signTransaction(tx)
      const sig = await connection.sendRawTransaction(signed.serialize())
      await connection.confirmTransaction({ signature: sig, ...latest }, 'confirmed')
      transactionToast(sig)
    } catch (err) {
      console.error(err)
    } finally {
      setSending(false)
    }
  }

  return (
    <div className="container mx-auto px-4">
      <Card>
        <CardHeader>
          <CardTitle>Send SOL with a memo to the Fish</CardTitle>
          <CardDescription>
            Destination address:
            <span className="ml-2 font-mono">
              <ExplorerLink path={`address/${FISH_ADDRESS}`} label={FISH_ADDRESS} />
            </span>
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="relative overflow-hidden rounded-xl border bg-gradient-to-br from-cyan-200/40 via-sky-200/30 to-blue-200/30 dark:from-cyan-500/10 dark:via-sky-500/10 dark:to-blue-500/10 mb-6">
            <div className="absolute -top-10 -right-10 opacity-20 blur-2xl w-56 h-56 rounded-full bg-cyan-300 dark:bg-cyan-700" />
            <div className="flex flex-col items-center text-center gap-4 p-6 md:p-8">
              <div className="rounded-2xl ring-1 ring-black/5 dark:ring-white/5 shadow-sm bg-white/60 dark:bg-white/10 p-3">
                <Image src="/fish.png" alt="Talking Fish" width={340} height={340} className="rounded-xl" />
              </div>
              <div>
                <div className="text-2xl font-semibold">Talking Memo</div>
                <div className="text-muted-foreground">Send a memo with your tip and make the fish talk.</div>
              </div>
            </div>
          </div>

          <div className="flex justify-center mb-4">
            <WalletButton />
          </div>

          <form className="flex flex-col gap-4 max-w-md mx-auto items-stretch text-center" onSubmit={onSubmit}>
            <label className="flex flex-col gap-2">
              <span>Amount (SOL)</span>
              <Input
                type="number"
                step="0.001"
                min="0"
                value={amountSol}
                onChange={(e) => setAmountSol(e.target.value)}
                placeholder="0.001"
              />
            </label>
            <label className="flex flex-col gap-2">
              <span>Memo</span>
              <Input
                type="text"
                maxLength={200}
                value={memo}
                onChange={(e) => setMemo(e.target.value)}
                placeholder="Write a memo..."
              />
            </label>
            <div className="flex justify-center">
              <Button type="submit" disabled={!publicKey || sending}>
                {sending ? 'Sending...' : 'Send SOL with Memo'}
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
