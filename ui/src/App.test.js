import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const homeLinkElement = screen.getByRole('link', { name: 'Home' });
  const postsLinkElement = screen.getByRole('link', { name: 'Home' });
  expect(homeLinkElement).toBeInTheDocument();
  expect(postsLinkElement).toBeInTheDocument();
});
