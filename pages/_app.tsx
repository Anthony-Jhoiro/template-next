import '../node_modules/@fortawesome/fontawesome-svg-core/styles.css';
import '../styles/globals.css'
import type {AppProps} from 'next/app'
import {Toaster} from "react-hot-toast";


function MyApp({Component, pageProps}: AppProps) {
  return <>
    <Toaster />
    <Component {...pageProps} />
  </>

}

export default MyApp
