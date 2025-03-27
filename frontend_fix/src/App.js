import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Dashboard from './pages/Dashboard';
import './App.css';

function App() {
  return (
    <Router>
      <div className="app">
        <Switch>
          <Route exact path="/" component={Dashboard} />
          {/* Add more routes as needed */}
        </Switch>
      </div>
    </Router>
  );
}

export default App;
