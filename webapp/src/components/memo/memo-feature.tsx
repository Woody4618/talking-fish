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

const DEFAULT_ADDRESS_1 = 'GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd'
const DEFAULT_ADDRESS_2 = 'GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd'
const MEMO_PROGRAM_ID = new PublicKey('MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr')

export default function MemoFeature() {
  const { connection } = useConnection()
  const { publicKey, signTransaction } = useWallet()
  const [address1, setAddress1] = useState(DEFAULT_ADDRESS_1)
  const [amountSol1, setAmountSol1] = useState('0.001')
  const [address2, setAddress2] = useState(DEFAULT_ADDRESS_2)
  const [amountSol2, setAmountSol2] = useState('0.001')
  const [memo, setMemo] = useState('Hello fish!')
  const [sending, setSending] = useState(false)
  const transactionToast = useTransactionToast()

  const pubkey1 = useMemo(() => new PublicKey(address1), [address1])
  const pubkey2 = useMemo(() => new PublicKey(address2), [address2])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!publicKey || !signTransaction) return

    try {
      setSending(true)
      const lamports1 = Math.floor(parseFloat(amountSol1 || '0') * LAMPORTS_PER_SOL)
      const lamports2 = Math.floor(parseFloat(amountSol2 || '0') * LAMPORTS_PER_SOL)
      if (!Number.isFinite(lamports1) || lamports1 <= 0) throw new Error('Enter a valid SOL amount for recipient 1')
      if (!Number.isFinite(lamports2) || lamports2 <= 0) throw new Error('Enter a valid SOL amount for recipient 2')

      const ix1 = SystemProgram.transfer({ fromPubkey: publicKey, toPubkey: pubkey1, lamports: lamports1 })
      const ix2 = SystemProgram.transfer({ fromPubkey: publicKey, toPubkey: pubkey2, lamports: lamports2 })
      const ixMemo = new TransactionInstruction({
        keys: [{ pubkey: publicKey, isSigner: true, isWritable: false }],
        programId: MEMO_PROGRAM_ID,
        data: Buffer.from(memo ?? '', 'utf8'),
      })

      const latest = await connection.getLatestBlockhash('confirmed')
      const tx = new Transaction({ feePayer: publicKey, ...latest }).add(ix1, ix2, ixMemo)
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
          <CardTitle>Send SOL with a memo to two recipients</CardTitle>
          <CardDescription>
            Destination addresses:
            <span className="ml-2 font-mono inline-block">
              <ExplorerLink path={`address/${address1}`} label={address1} />
            </span>
            <span className="ml-2 font-mono inline-block">
              <ExplorerLink path={`address/${address2}`} label={address2} />
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
                <div className="text-muted-foreground">Send a memo with your tip to two wallets.</div>
              </div>
            </div>
          </div>

          <div className="flex justify-center mb-4">
            <WalletButton />
          </div>

          <form className="flex flex-col gap-4 max-w-md mx-auto items-stretch text-center" onSubmit={onSubmit}>
            <label className="flex flex-col gap-2">
              <span>Recipient 1 Address</span>
              <Input value={address1} onChange={(e) => setAddress1(e.target.value)} placeholder={DEFAULT_ADDRESS_1} />
            </label>
            <label className="flex flex-col gap-2">
              <span>Amount 1 (SOL)</span>
              <Input
                type="number"
                step="0.001"
                min="0"
                value={amountSol1}
                onChange={(e) => setAmountSol1(e.target.value)}
                placeholder="0.001"
              />
            </label>

            <label className="flex flex-col gap-2">
              <span>Recipient 2 Address</span>
              <Input value={address2} onChange={(e) => setAddress2(e.target.value)} placeholder={DEFAULT_ADDRESS_2} />
            </label>
            <label className="flex flex-col gap-2">
              <span>Amount 2 (SOL)</span>
              <Input
                type="number"
                step="0.001"
                min="0"
                value={amountSol2}
                onChange={(e) => setAmountSol2(e.target.value)}
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
