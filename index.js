import {registerCustomElement, registerPorts} from "elm-mapbox";
import { Elm } from './src/Main.elm'

registerCustomElement({token: 'pk.eyJ1Ijoic3ppbmdnZWxlciIsImEiOiJjam9hajN6NHowMG41M3Btc25qMWR0aW8wIn0.f4UGMPp_0Hl7KNhOSYy4Og'});
// registerCustomElement();
var app = Elm.Main.init({
  node: document.querySelector('main')
});
registerPorts(app);
