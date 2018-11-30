import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr";
import { loadDynamicBannerText } from '../components/banner';

initMapbox();
loadDynamicBannerText();
