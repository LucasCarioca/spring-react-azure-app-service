export const API_URL = () => {
    if (process.env.REACT_APP_ENVIRONMENT === 'local') 
        return 'http://localhost:8080';
    else if (process.env.REACT_APP_ENVIRONMENT === 'development')
        return 'https://springreact-nonprod.azurewebsites.net'
    else return 'https://springreact-nonprod.azurewebsites.net' // same as nonprod for now
};