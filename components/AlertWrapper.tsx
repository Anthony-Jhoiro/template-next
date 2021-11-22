import React, {
  Children,
  isValidElement,
  PropsWithChildren,
  ReactElement,
} from "react";
import {Alert} from "./Alert";
import {useAlertList} from "../hooks/useAlertList";
import {ComponentWithAlerts} from "../types/alerts";


export interface AlertWrapperProps {
  children: ReactElement | ReactElement[]
}

export function AlertWrapper({children}: AlertWrapperProps) {
  const [alerts, newAlert] = useAlertList([]);


  return (
    <div className={'w-screen overflow-x-hidden'}>
      <div id={"alert-wrapper"} className={'fixed top-0 right-0 bg-red-50 w-1/4'}>
        {
          alerts.map(alert => <div key={alert.id}
                                   className={'my-5 transition transition-transform ' + (alert.fadeOut ? "transform translate-x-full" : "")}>
            <Alert alertType={alert.type} title={alert.title}>{alert.children}</Alert>
          </div>)
        }
      </div>
      <div id={"page"}>
        {
          Children.map(children, child =>
            isValidElement(child)
              ? React.cloneElement(
                child as ReactElement<PropsWithChildren<ComponentWithAlerts>>,
                {newAlert}
              )
              : child
          )
        }
      </div>
    </div>

  )
}