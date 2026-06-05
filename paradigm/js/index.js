// Interactive mailto submission handler
function handleContactForm(event, portalName) {
  event.preventDefault();
  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const message = document.getElementById("message").value;

  // Dispatch live cross-tab telemetry event
  try {
    const telemetryChannel = new BroadcastChannel("ztl-telemetry");
    telemetryChannel.postMessage({
      portal: "paradigm",
      type: "contact",
      message: `Telemetry signal: ${name} initiated a Paradigm custom SaaS application query.`,
      stats: { load: "18.4%" },
    });
  } catch (e) {}

  const subject = encodeURIComponent(`${portalName} Portal Inquiry - ${name}`);
  const body = encodeURIComponent(
    `Name: ${name}\nEmail: ${email}\n\nMessage:\n${message}`,
  );

  window.location.href = `mailto:Bhargavnarumanchi779@gmail.com?subject=${subject}&body=${body}`;

  alert(
    "Your local mail client has been opened to transmit this inquiry to Bhargavnarumanchi779@gmail.com!",
  );
  event.target.reset();
}

// Hamburger Menu Interactive Logic
const hamburger = document.querySelector(".hamburger");
const navMenu = document.querySelector(".nav-menu");
const mobileLinks = document.querySelectorAll(
  ".mobile-main-link, .mobile-sublink",
);
const mobileDropdown = document.querySelector(".mobile-dropdown");
const mobileTrigger = document.querySelector(".mobile-dropdown-trigger");

hamburger.addEventListener("click", () => {
  hamburger.classList.toggle("active");
  navMenu.classList.toggle("active");
  document.body.style.overflow = navMenu.classList.contains("active")
    ? "hidden"
    : "";
});

// Close hamburger menu when a regular link or sublink is clicked
mobileLinks.forEach((link) => {
  link.addEventListener("click", () => {
    hamburger.classList.remove("active");
    navMenu.classList.remove("active");
    document.body.style.overflow = "";
    if (mobileDropdown) {
      mobileDropdown.classList.remove("active");
    }
  });
});

// Toggle mobile products dropdown menu
if (mobileTrigger && mobileDropdown) {
  mobileTrigger.addEventListener("click", (e) => {
    e.stopPropagation();
    mobileDropdown.classList.toggle("active");
  });
}

// Intersection Observer for Smooth Scroll Animations (with viewport fallback)
try {
  const observerOptions = {
    threshold: 0.05,
    rootMargin: "0px 0px -10px 0px",
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
      }
    });
  }, observerOptions);

  
  // Batch Loading and Compute Implementation to reduce Client-Side Memory (CSM)
  const animateElements = document.querySelectorAll(".animate");
  const BATCH_SIZE = 3;
  let currentIndex = 0;

  function processObserverBatch() {
    const end = Math.min(currentIndex + BATCH_SIZE, animateElements.length);
    for (let i = currentIndex; i < end; i++) {
      observer.observe(animateElements[i]);
    }
    currentIndex = end;
    if (currentIndex < animateElements.length) {
      if (window.requestIdleCallback) {
        requestIdleCallback(processObserverBatch);
      } else {
        setTimeout(processObserverBatch, 16);
      }
    }
  }
  processObserverBatch();

} catch (e) {
  document.querySelectorAll(".animate").forEach((el) => {
    el.classList.add("visible");
  });
}
