import * as React from "react";
import * as ReactDOM from "react-dom";
import UniverseMap from "maps/universe_map";

document.addEventListener("turbolinks:load", () => {
  const universeMapContainer = document.getElementById("universe-map-container");

  if (universeMapContainer) {
    ReactDOM.render(
      <UniverseMap />,
      universeMapContainer,
    );
  }
});
