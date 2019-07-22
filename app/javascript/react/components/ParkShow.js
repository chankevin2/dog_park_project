import React from 'react';


const ParkShow = props => {
  return(
    <div className="park">
      <h3>{props.name}</h3>
      <p>Description: {props.description}</p>
      <p>Address: {props.address}, {props.city}, {props.state}  {props.zip} </p>
      <br></br>
      <a href={`/parks/${props.id}/reviews/new`}>Add New Review</a>
    </div>
  )
}

export default ParkShow
