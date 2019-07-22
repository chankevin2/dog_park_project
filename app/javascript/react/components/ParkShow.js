import React from 'react';


const ParkShow = props => {
  return(
    <div>
      <h3>{props.name}</h3>
      <p>Description: {props.description}</p>
      <p>Address: {props.address} </p>
      <p>{props.city} </p>
      <p>{props.state} </p>
      <p>{props.zip} </p>
    </div>
  )
}

export default ParkShow
