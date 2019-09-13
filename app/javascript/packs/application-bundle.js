import ReactOnRails from 'react-on-rails';

import Root from '../bundles/Application/components/Root';

import 'antd/dist/antd.css';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Root,
});
