// Use this sample to create your own voice commands
intent(`hello`, p => {
    p.play(`(hello|hi there)`);
});

intent(`What is your name?`, p => {
    p.play(`It's Alan, and yours?`);
});


intent(`What does this app do?`, p => {
    p.play(`Nightingale will remind you when you should take your medication. 
            It will also allow you to view your prescribed medication. 
            As well as view and edit your calendar.`);
});

intent(`(Go to Home)`, p => {
    p.play({ command: 'navigation', route: 'Home' });
    p.play(`Navigating to Home`);
});

intent(`(Go to Medicine)`, p => {
    p.play({ command: 'navigation', route: 'Medicine' });
    p.play(`Navigating to Medicine`);
});

intent(`(Go to Schedule)`, p => {
    p.play({ command: 'navigation', route: 'Schedule' });
    p.play(`Navigating to Schedule`);
});

intent(`(Go to Doctor)`, p => {
    p.play({ command: 'navigation', route: 'Doctor' });
    p.play(`Navigating to Doctor`);
});


