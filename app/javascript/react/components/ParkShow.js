import React from 'react';


const ParkShow = props => {
  return(
    <div>
      <h3>{props.name}</h3>
      <p>Description: {props.description}</p>
      <p1>Address: {props.address} </p1>
      <p2>{props.city} </p2>
      <p3>{props.state} </p3>
      <p4>{props.zip} </p4>
    </div>
  )
}

export default ParkShow
