import { render, screen } from '@testing-library/react';
import App from './App';

test('renders App Ref Card header', () => {
    render(<App />);
    const headerElement = screen.getByText(/App Ref. Card 02/i);
    expect(headerElement).toBeInTheDocument();
});