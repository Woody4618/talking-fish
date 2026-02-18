'use client'

import { useConnection, useWallet } from '@solana/wallet-adapter-react'
import { LAMPORTS_PER_SOL, PublicKey, SystemProgram, Transaction } from '@solana/web3.js'
import { useState, useMemo } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Button } from '@/components/ui/button'
import { useTransactionToast } from '@/components/use-transaction-toast'
import { ExplorerLink } from '@/components/cluster/cluster-ui'
import Image from 'next/image'
import { WalletButton } from '@/components/solana/solana-provider'
import QRCode from 'react-qr-code'

const DEFAULT_ADDRESS = 'GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd'

export default function MemoFeature() {
  const { connection } = useConnection()
  const { publicKey, signTransaction } = useWallet()
  const [address, setAddress] = useState(DEFAULT_ADDRESS)
  const [amountSol, setAmountSol] = useState('0.001')
  const [sending, setSending] = useState(false)
  const transactionToast = useTransactionToast()

  const pubkey = useMemo(() => new PublicKey(address), [address])

  const solanaPayUrl = useMemo(() => {
    if (typeof window === 'undefined') return ''
    const url = new URL('/api/solana-pay', window.location.origin)
    const amt = parseFloat(amountSol || '0')
    if (address && amt > 0) {
      url.searchParams.set('a1', address)
      url.searchParams.set('s1', String(amt))
    }
    return url.toString()
  }, [address, amountSol])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!publicKey || !signTransaction) return

    try {
      setSending(true)
      const lamports = Math.floor(parseFloat(amountSol || '0') * LAMPORTS_PER_SOL)
      if (!Number.isFinite(lamports) || lamports <= 0) throw new Error('Enter a valid SOL amount')

      const ix = SystemProgram.transfer({ fromPubkey: publicKey, toPubkey: pubkey, lamports })

      const latest = await connection.getLatestBlockhash('confirmed')
      const tx = new Transaction({ feePayer: publicKey, ...latest }).add(ix)
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
          <CardTitle>Send SOL</CardTitle>
          <CardDescription>
            Destination address:
            <span className="ml-2 font-mono inline-block">
              <ExplorerLink path={`address/${address}`} label={address} />
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
                <div className="text-2xl font-semibold">Talking Fish</div>
                <div className="text-muted-foreground">Send a tip to the printer wallet.</div>
              </div>
            </div>
          </div>

          <div className="flex justify-center mb-4">
            <WalletButton />
          </div>

          <form className="flex flex-col gap-4 max-w-md mx-auto items-stretch text-center" onSubmit={onSubmit}>
            <div className="flex justify-center">
              <Button type="submit" disabled={!publicKey || sending}>
                {sending ? 'Sending...' : 'Send SOL'}
              </Button>
            </div>
          </form>

          {solanaPayUrl && (
            <div className="mt-8 flex flex-col items-center gap-2">
              <div className="text-sm text-muted-foreground">Or scan with a mobile wallet (Solana Pay)</div>
              <div className="bg-white p-2 rounded-md">
                <QRCode value={solanaPayUrl} size={240} />
              </div>
              <a href={solanaPayUrl} className="text-xs break-all underline" target="_blank" rel="noreferrer">
                {solanaPayUrl}
              </a>
            </div>
          )}

          <div className="mt-10 max-w-md mx-auto">
            <label className="flex flex-col gap-2">
              <span>Printer Address</span>
              <Input value={address} onChange={(e) => setAddress(e.target.value)} placeholder={DEFAULT_ADDRESS} />
            </label>
            <label className="flex flex-col gap-2 mt-2">
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
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
