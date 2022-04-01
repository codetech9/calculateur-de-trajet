import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller");
    console.log("test2");
  }

  initGoogle() {
    // setup autocomplete
  }

  placeSelected() {
    // use values from autocomplete
  }
}
