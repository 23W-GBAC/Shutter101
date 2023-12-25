<script>
    const script = document.createElement('script');
    script.src = './mermaid.js';
    document.head.appendChild(script);

    script.onload = () => {
        mermaid.initialize({ startOnLoad: true });

        // Your Mermaid chart code goes here
        mermaid.init(undefined, document.querySelectorAll('.mermaid'));
    };
</script>
