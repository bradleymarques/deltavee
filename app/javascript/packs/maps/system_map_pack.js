import * as React from "react";
import ReactDom from "react-dom";

import SystemMap from "maps/system_map";

document.addEventListener("turbolinks:load", () => {
  const mapsOnPage = document.getElementsByClassName("system-map");

  Array.prototype.forEach.call(
    mapsOnPage, (mapOnPage) => {
      const url = mapOnPage.dataset.url;
      ReactDom.render(<SystemMap url={url} />, mapOnPage);
    }
  );
});
