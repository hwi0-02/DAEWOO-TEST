document.addEventListener('DOMContentLoaded', function() {
    fetch('/api/external-data')
        .then(response => response.json())
        .then(data => {
            const dataList = document.getElementById('external-data-list');
            data.forEach(user => {
                const listItem = document.createElement('li');
                listItem.textContent = `ID: ${user.id}, Name: ${user.name}, Username: ${user.username}, Email: ${user.email}`;
                dataList.appendChild(listItem);
            });
        })
        .catch(error => console.error('Error fetching external data:', error));
});
