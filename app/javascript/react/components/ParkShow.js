import React from 'react';


const ParkShow = props => {
  return(
    <div className="park">
      <h3>{props.name}</h3>
      <p>Description: {props.description}</p>
      <p>Address: {props.address}</p>
      <p>{props.city},</p>
      <p>{props.state}</p>
      <p>{props.zip}</p>
      </p>
      <br></br>
      <a href={`/parks/${props.id}/reviews/new`}>Add New Review</a>
    </div>
  )
}

export default ParkShow
