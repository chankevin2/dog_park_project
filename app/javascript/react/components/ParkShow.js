import React from 'react';


const ParkShow = props => {
  return(
    <div className="callout">
      <h3>{props.name}</h3>
      <p id="descr">Description: {props.description}</p>
      <p id="address">Address: {props.address}, {props.city}, {props.state}  {props.zip} </p>
      <br></br>
      <a href={`/parks/${props.id}/reviews/new`}>Add New Review</a>
    </div>
  )
}

export default ParkShow
