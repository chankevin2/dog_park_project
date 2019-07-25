import React from 'react';


const ParkShow = props => {
  return(
    <div className="parkShow">
    <div className="callout parkshowtile">
      <h3 className="callout showtitle">{props.name}</h3>
      <h5>  Description:</h5>
     <p id="descr">{props.description}</p>
       <hr className="indexbar"/>
      <p id="address">Address: {props.address}</p>
      <p>{props.city}, {props.state}  {props.zip} </p>
      <div>
      <a href={`/parks/${props.id}/edit`}>Edit</a> &nbsp; / &nbsp;
      <a href={`/parks/${props.id}/reviews/new`}>Add New Review</a>
      </div>
    </div>
    </div>
  )
}

export default ParkShow
