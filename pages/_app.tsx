import '../node_modules/@fortawesome/fontawesome-svg-core/styles.css';
import '../styles/globals.css'
import type {AppProps} from 'next/app'
import {SessionProvider} from "next-auth/react"
import {AuthContextProvider, useAuthContext} from "../hooks/useAuthContext";
import {CurrentUserProvider} from "../hooks/useCurrentUser";
import {useEffect, useState} from "react";
import {createAnonymousClient, createAuthClient} from "../utils/urqlClient";
import { Provider as UrqlProvider } from 'urql';



function ClientProvider(props: React.PropsWithChildren<{}>) {
  const { token } = useAuthContext();

  const [urqlClient, setUrqlClient] = useState(createAnonymousClient());

  console.log('ClientProvider', { token });

  useEffect(() => {
    const hasNoToken = token === undefined || token === null;
    if (!hasNoToken) {
      console.log('Creating auth token');
      setUrqlClient(createAuthClient());
    }
    if (hasNoToken) {
      console.log('Creating anonymous token');
      setUrqlClient(createAnonymousClient());
    }
  }, [token]);

  return <UrqlProvider value={urqlClient}>{props.children}</UrqlProvider>;
}


function MyApp({Component, pageProps: {session, ...pageProps}}: AppProps) {
  return <>
    <SessionProvider session={session}>
      <AuthContextProvider>
        <ClientProvider>
          <CurrentUserProvider>
            <Component {...pageProps} />
          </CurrentUserProvider>
        </ClientProvider>l
      </AuthContextProvider>
    </SessionProvider>
  </>

}

// export default appWithTranslation(MyApp)
export default MyApp
