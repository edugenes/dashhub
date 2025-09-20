import React from 'react';
import { MetricsCard } from '@/components/dashboard/MetricsCard';
import { Button } from '@/components/ui/Button';

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white shadow-sm border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center">
              <h1 className="text-2xl font-bold text-gray-900">
                CryptoMiningHub
              </h1>
            </div>
            <div className="flex items-center space-x-4">
              <Button variant="outline">Connect Wallet</Button>
              <Button>Get Started</Button>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Welcome Section */}
        <div className="mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-2">
            Welcome to CryptoMiningHub
          </h2>
          <p className="text-lg text-gray-600">
            Your complete solution for cryptocurrency mining, trading, and blockchain monitoring.
          </p>
        </div>

        {/* Metrics Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <MetricsCard
            title="Total Hash Rate"
            value="2.45 TH/s"
            change={5.2}
            changeType="positive"
            icon={
              <div className="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center">
                <span className="text-blue-600 text-lg">⚡</span>
              </div>
            }
          />
          <MetricsCard
            title="Daily Earnings"
            value="$124.50"
            change={-2.1}
            changeType="negative"
            icon={
              <div className="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center">
                <span className="text-green-600 text-lg">💰</span>
              </div>
            }
          />
          <MetricsCard
            title="Active Rigs"
            value="12"
            change={0}
            changeType="neutral"
            icon={
              <div className="w-8 h-8 bg-purple-100 rounded-full flex items-center justify-center">
                <span className="text-purple-600 text-lg">🖥️</span>
              </div>
            }
          />
          <MetricsCard
            title="Uptime"
            value="99.8%"
            change={0.1}
            changeType="positive"
            icon={
              <div className="w-8 h-8 bg-orange-100 rounded-full flex items-center justify-center">
                <span className="text-orange-600 text-lg">📊</span>
              </div>
            }
          />
        </div>

        {/* Features Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <div className="flex items-center mb-4">
              <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center mr-3">
                <span className="text-blue-600 text-xl">⛏️</span>
              </div>
              <h3 className="text-lg font-semibold text-gray-900">Mining Monitor</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Monitor your mining rigs in real-time with detailed metrics and alerts.
            </p>
            <Button variant="outline" className="w-full">
              View Mining Dashboard
            </Button>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <div className="flex items-center mb-4">
              <div className="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center mr-3">
                <span className="text-green-600 text-xl">💱</span>
              </div>
              <h3 className="text-lg font-semibold text-gray-900">Crypto Trading</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Trade cryptocurrencies and manage your portfolio with advanced tools.
            </p>
            <Button variant="outline" className="w-full">
              Open Trading Panel
            </Button>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <div className="flex items-center mb-4">
              <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center mr-3">
                <span className="text-purple-600 text-xl">🔗</span>
              </div>
              <h3 className="text-lg font-semibold text-gray-900">Blockchain Analytics</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Analyze blockchain data and track transactions across multiple networks.
            </p>
            <Button variant="outline" className="w-full">
              Explore Blockchain
            </Button>
          </div>
        </div>

        {/* CTA Section */}
        <div className="mt-12 bg-gradient-to-r from-blue-600 to-purple-600 rounded-lg p-8 text-center">
          <h3 className="text-2xl font-bold text-white mb-4">
            Ready to Start Mining?
          </h3>
          <p className="text-blue-100 mb-6 max-w-2xl mx-auto">
            Join thousands of miners who trust CryptoMiningHub for their cryptocurrency operations.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button variant="secondary" size="lg">
              Start Free Trial
            </Button>
            <Button variant="outline" size="lg" className="bg-white text-blue-600 hover:bg-gray-50">
              Learn More
            </Button>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-white border-t border-gray-200 mt-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <div className="text-center text-gray-600">
            <p>&copy; 2024 CryptoMiningHub. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}