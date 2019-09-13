import PropTypes from 'prop-types';
import React from 'react';
import { Layout, Input } from 'antd';
const { Content } = Layout;

export default class Root extends React.Component {
  static propTypes = {
    app_name: PropTypes.string.isRequired,
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class
    this.state = { name: this.props.name };
  }

  updateName = (name) => {
    this.setState({ name });
  };

  render() {
    return (
      <div>
        <Content>
          <div style={{ padding: 24 }}>
            <h1>Welcome to { this.props.app_name}!</h1>
            <h3>
              Hello, {this.state.name}!
            </h3>
            <hr />
            <form >
              <label htmlFor="name">
                Say hello to:
              </label>
              <Input
                id="name"
                type="text"
                value={this.state.name}
                onChange={(e) => this.updateName(e.target.value)}
              />
            </form>
          </div>
        </Content>
      </div>
    );
  }
}
