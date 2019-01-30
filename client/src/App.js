import React, { Component } from "react";
import getWeb3 from "./utils/getWeb3";
import logo from "./logo300x300.png";

import "./App.css";

class App extends Component {
  state = { web3: null, accounts: null };

  componentDidMount = async () => {
    try {
      // Get network provider and web3 instance.
      const web3 = await getWeb3();

      // Use web3 to get the user's accounts.
      const accounts = await web3.eth.getAccounts();
     
      this.setState({ web3, accounts }, this.runExample);
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );
      console.error(error);
    }
  };

  runExample = async () => {
    const { accounts } = this.state;
    console.log(accounts);
  };

  render() {
    if (!this.state.web3) {
      return <div>Loading Web3, accounts, and contract...</div>;
    }
    return (
      <div className="App">
        <img src={logo} alt="SureVX logo" />
        <div>This is the very first version of the SureVX platform.</div>
      </div>
    );
  }
}

export default App;
