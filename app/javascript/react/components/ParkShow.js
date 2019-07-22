import React from 'react';


const ParkShow = props => {
  return(
    <div>
      <h3>{props.name}</h3>
      <p>Description: {props.description}</p>
      <p>Address: {props.address}, {props.city}, {props.state} {props.zip}</p>
    </div>
  )
}

export default ParkShow
