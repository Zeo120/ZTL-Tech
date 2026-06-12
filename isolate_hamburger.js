const fs = require('fs');

// 1. Remove toggleDrawer from routes.js
let routesContent = fs.readFileSync('paradigm/js/routes.js', 'utf8');

// Regex to capture toggleDrawer function
const toggleDrawerRegex = /function toggleDrawer\(isOpen\) {[\s\S]*?}\n\n/m;
if (routesContent.match(toggleDrawerRegex)) {
    routesContent = routesContent.replace(toggleDrawerRegex, '');
    fs.writeFileSync('paradigm/js/routes.js', routesContent);
}

// 2. Inject toggleDrawer into admin.html as an inline isolated script
let html = fs.readFileSync('paradigm/admin.html', 'utf8');
const isolatedScript = `
    <!-- Isolated Hamburger Logic -->
    <script>
      function toggleDrawer(isOpen) {
        const drawer = document.getElementById("sidebar-drawer");
        const backdrop = document.getElementById("drawer-backdrop");
        if (isOpen) {
          drawer.classList.add("active");
          backdrop.classList.add("active");
        } else {
          drawer.classList.remove("active");
          backdrop.classList.remove("active");
        }
      }
    </script>
`;

if (!html.includes('<!-- Isolated Hamburger Logic -->')) {
    html = html.replace('</head>', isolatedScript + '\\n  </head>');
    fs.writeFileSync('paradigm/admin.html', html);
    console.log('Hamburger logic successfully isolated.');
} else {
    console.log('Hamburger logic already isolated.');
}
