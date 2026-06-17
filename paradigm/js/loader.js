document.addEventListener('DOMContentLoaded', async () => {
    const components = [
        { id: 'view-crm', url: 'views/crm.html' },
        { id: 'view-ops', url: 'views/ops.html' },
        { id: 'view-payroll', url: 'views/payroll.html' },
        { id: 'view-hr', url: 'views/hr.html' },
        { id: 'sidebar-drawer', url: 'components/sidebar.html' },
        { id: 'modals', url: 'components/modals.html' }
    ];

    try {
        await Promise.all(components.map(async (comp) => {
            const response = await fetch(comp.url);
            if (!response.ok) {
                console.error(`Failed to load ${comp.url}: ${response.statusText}`);
                return;
            }
            const html = await response.text();
            const el = document.getElementById(comp.id);
            if (el) {
                el.innerHTML = html;
            } else {
                console.warn(`Container element with id '${comp.id}' not found.`);
            }
        }));
        
        // Dispatch the custom event when all partials are loaded and inserted into the DOM
        document.dispatchEvent(new Event('ParadigmDOMReady'));
    } catch (error) {
        console.error('Error loading partials:', error);
    }
});
