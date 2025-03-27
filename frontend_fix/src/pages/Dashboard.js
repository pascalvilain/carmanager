import React from 'react';
import './Dashboard.css';

function Dashboard() {
  return (
    <div className="dashboard">
      <header className="dashboard-header">
        <h1>Alpin Royal Casino Management System</h1>
        <div className="user-info">
          <span>Welcome, Admin</span>
        </div>
      </header>
      
      <div className="dashboard-content">
        <div className="dashboard-card">
          <h2>Player Tracking</h2>
          <p>Track player activities, gaming sessions, and consumption</p>
          <button>Open Module</button>
        </div>
        
        <div className="dashboard-card">
          <h2>Network Design</h2>
          <p>Manage network devices, surveillance cameras, and infrastructure</p>
          <button>Open Module</button>
        </div>
        
        <div className="dashboard-card">
          <h2>Inventory Management</h2>
          <p>Track assets, equipment, and supplies</p>
          <button>Open Module</button>
        </div>
        
        <div className="dashboard-card">
          <h2>Ticket System</h2>
          <p>Manage maintenance and IT support tickets</p>
          <button>Open Module</button>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;
