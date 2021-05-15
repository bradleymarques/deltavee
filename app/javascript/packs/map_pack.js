import * as React from "react";
import * as ReactDOM from "react-dom";

document.addEventListener("turbolinks:load", () => {
  const universeMapContainer = document.getElementById("universe-map-container");

  if (universeMapContainer) {
    ReactDOM.render(
      <p>The Map</p>,
      universeMapContainer,
    );
  }
});
