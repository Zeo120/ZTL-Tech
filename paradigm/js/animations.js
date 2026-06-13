// Global UI Animations: Magnetic Hovers, Glass Tilts, and Staggered Loads
document.addEventListener('DOMContentLoaded', () => {
    // 1. Contextual Gradients & Glass Panel Tilt
    const glassPanels = document.querySelectorAll('.glass-panel, .card, .employee-card, .login-box, .stat-card, .payroll-card');
    
    glassPanels.forEach(panel => {
        panel.addEventListener('mousemove', (e) => {
            const rect = panel.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            // Contextual Flashlight Gradient
            panel.style.background = `radial-gradient(circle at ${x}px ${y}px, rgba(147, 51, 234, 0.15) 0%, rgba(255,255,255,0) 60%), var(--card-bg, rgba(20,20,20,0.4))`;
            
            // Magnetic Tilt
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            const rotateX = ((y - centerY) / centerY) * -4; // Max 4 deg tilt
            const rotateY = ((x - centerX) / centerX) * 4;
            
            panel.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.02, 1.02, 1.02)`;
            panel.style.transition = 'transform 0.1s ease';
        });
        
        panel.addEventListener('mouseleave', () => {
            panel.style.background = '';
            panel.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)';
            panel.style.transition = 'transform 0.5s ease, background 0.5s ease';
        });
    });

    // 2. Magnetic Buttons
    const buttons = document.querySelectorAll('button:not(.no-magnet), .btn, .sub-tab-btn');
    
    buttons.forEach(btn => {
        btn.addEventListener('mousemove', (e) => {
            const rect = btn.getBoundingClientRect();
            const x = e.clientX - rect.left - rect.width/2;
            const y = e.clientY - rect.top - rect.height/2;
            
            btn.style.transform = `translate(${x * 0.25}px, ${y * 0.25}px)`;
            btn.style.transition = 'transform 0.1s ease';
        });
        
        btn.addEventListener('mouseleave', () => {
            btn.style.transform = `translate(0px, 0px)`;
            btn.style.transition = 'transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
        });
    });

    // 3. Staggered Animations (Add class to list items)
    const listItems = document.querySelectorAll('.employee-row, .card-item, .stagger-item, .stat-card, tr');
    listItems.forEach((item, index) => {
        // Skip header rows
        if(item.tagName.toLowerCase() === 'tr' && item.closest('thead')) return;
        
        item.style.opacity = '0';
        item.style.animation = `slideInUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards`;
        item.style.animationDelay = `${(index % 15) * 0.04}s`; // Cap delay modulo
    });
});
