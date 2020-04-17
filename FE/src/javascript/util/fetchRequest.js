const fetchRequest = (url, method, data) => {
    return fetch(url, {
        method: method,
        mode: 'cors',
        cache: 'no-cache',
        headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJwb29nbGUiLCJpZCI6MX0.ju5CGjqxRm5HkIJspZ-xY_LO5z6tmxlOqJ26M__GXf0'
        },
        body: JSON.stringify(data)
    });
}

export {fetchRequest};