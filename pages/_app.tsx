import '../styles/globals.css'
import type {AppProps} from 'next/app'
import {AlertWrapper} from "../components/AlertWrapper";

function MyApp({Component, pageProps}: AppProps) {
  return <AlertWrapper>
    <Component {...pageProps} />
  </AlertWrapper>
}

export default MyApp
