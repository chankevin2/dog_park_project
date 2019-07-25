import React from 'react';


const ParkShow = props => {
  return(
    <div className="callout parkshowtile">
      <h3 className="callout showtitle">{props.name}</h3>
    <h5>  Description:</h5> <p id="descr">{props.description}</p>
      <p id="address">Address: {props.address}, {props.city}, {props.state}  {props.zip} </p>
      <br></br>
      <a href={`/parks/${props.id}/edit`}>Edit</a>
      <br></br>
      <a href={`/parks/${props.id}/reviews/new`}>Add New Review</a>
    </div>
  )
}

export default ParkShow
