declare global {
  interface Window {
    env: {
      API_ENDPOINT: string;
    };
  }
}

export const environment = {
  production: true,
  baseUrl: window['env'].API_ENDPOINT,
};
