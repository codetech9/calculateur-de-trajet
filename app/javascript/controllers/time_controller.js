import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Time controller est connecté");
  }
}
