import React from 'react'
import ParkShowContainer from '../containers/ParkShowContainer'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

export const App = (props) => {
  return (

    <BrowserRouter>
      <Switch>
        <Route exact path="/parks/:id" component={ParkShowContainer}/>
      </Switch>
    </BrowserRouter>
  )
}

export default App
