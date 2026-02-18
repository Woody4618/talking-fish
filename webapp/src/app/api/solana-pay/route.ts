import { NextRequest } from 'next/server'
import {
  Connection,
  PublicKey,
  SystemProgram,
  Transaction,
  TransactionInstruction,
  clusterApiUrl,
  LAMPORTS_PER_SOL,
} from '@solana/web3.js'

const CORS_HEADERS = {
  'Content-Type': 'application/json',
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
}

function getBaseUrl(req: NextRequest) {
  const proto = req.headers.get('x-forwarded-proto') || 'https'
  const host = req.headers.get('x-forwarded-host') || req.headers.get('host') || ''
  if (host) return `${proto}://${host}`
  const { origin } = new URL(req.url)
  return origin
}

function getClusterEndpoint(searchParams: URLSearchParams): string {
  const p = (searchParams.get('network') || searchParams.get('cluster') || '').toLowerCase()
  switch (p) {
    case 'devnet':
      return clusterApiUrl('devnet')
    case 'testnet':
      return clusterApiUrl('testnet')
    case 'mainnet':
    case 'mainnet-beta':
      return clusterApiUrl('mainnet-beta')
    default:
      return clusterApiUrl('devnet')
  }
}

export async function OPTIONS() {
  return new Response(null, { status: 204, headers: CORS_HEADERS })
}

export async function GET(req: NextRequest) {
  try {
    const { searchParams } = new URL(req.url)
    const baseUrl = getBaseUrl(req)
    const iconOverride = searchParams.get('icon')
    const icon = iconOverride || `${baseUrl}/fish.png`

    return json({ label: 'Fish', icon })
  } catch (_e: unknown) {
    return json({ label: 'Talking Fish', icon: '' }, 200)
  }
}

export async function POST(req: NextRequest) {
  try {
    const { searchParams } = new URL(req.url)
    const body = (await req.json().catch(() => ({}))) as Record<string, unknown>

    const account = typeof body.account === 'string' ? (body.account as string) : undefined
    const a1 = searchParams.get('a1')
    const s1 = parseFloat(searchParams.get('s1') || '0')
    const memoText = searchParams.get('m') || ''

    console.log('[SolanaPay][POST]', { account, a1, s1, memoText })

    if (!account) return json({ transaction: '', message: '', error: 'Missing account in body' }, 400)
    if (!a1 || s1 <= 0) return json({ transaction: '', message: '', error: 'No valid recipient' }, 400)

    const feePayer = new PublicKey(account)
    const lamports = Math.floor(s1 * LAMPORTS_PER_SOL)

    const endpoint = getClusterEndpoint(searchParams)
    const conn = new Connection(endpoint, 'confirmed')
    const { blockhash, lastValidBlockHeight } = await conn.getLatestBlockhash('confirmed')

    const tx = new Transaction({ feePayer, blockhash, lastValidBlockHeight })
    tx.add(SystemProgram.transfer({ fromPubkey: feePayer, toPubkey: new PublicKey(a1), lamports }))
    if (memoText) {
      tx.add(
        new TransactionInstruction({
          keys: [{ pubkey: feePayer, isSigner: true, isWritable: true }],
          programId: new PublicKey('MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr'),
          data: Buffer.from(memoText, 'utf8'),
        }),
      )
    }

    const serialized = tx.serialize({ requireAllSignatures: false, verifySignatures: false })
    const transaction = Buffer.from(serialized).toString('base64')

    return json({ transaction, message: 'Talking Fish payment' })
  } catch (e: unknown) {
    const msg = e instanceof Error ? e.message : String(e)
    console.error('[SolanaPay][POST][Error]', msg)
    return json({ transaction: '', message: '', error: msg }, 500)
  }
}

function json(obj: unknown, status = 200) {
  return new Response(JSON.stringify(obj), { status, headers: CORS_HEADERS })
}
