import './main.css';
import { Simple } from './App/Simple.elm';
import { LoadJson } from './App/LoadJson.elm';
import registerServiceWorker from './registerServiceWorker';


//Simple.embed(document.getElementById('root'));
LoadJson.embed(document.getElementById('root'));

registerServiceWorker();
