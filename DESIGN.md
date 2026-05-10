<html lang="nl"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@400;500;600;700;800;900&amp;family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48;
        }
        .host-city-pattern {
            background-image: radial-gradient(circle at 2px 2px, rgba(110, 36, 246, 0.05) 1px, transparent 0);
            background-size: 16px 16px;
        }
        .input-glow:focus {
            box-shadow: 0 0 0 4px rgba(71, 0, 176, 0.1);
        }
    </style>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "surface-container-lowest": "#ffffff",
                        "on-primary-fixed": "#22005d",
                        "secondary-container": "#5ce9fe",
                        "error": "#ba1a1a",
                        "error-container": "#ffdad6",
                        "on-primary": "#ffffff",
                        "surface-dim": "#dadada",
                        "on-tertiary-fixed": "#410004",
                        "tertiary-fixed-dim": "#ffb3ae",
                        "surface-container-low": "#f3f3f4",
                        "on-surface-variant": "#494456",
                        "primary-fixed-dim": "#cfbcff",
                        "on-primary-container": "#cfbdff",
                        "background": "#f9f9f9",
                        "primary": "#4700b0",
                        "outline-variant": "#cbc3d9",
                        "inverse-primary": "#cfbcff",
                        "inverse-surface": "#2f3131",
                        "primary-container": "#6200eb",
                        "on-error": "#ffffff",
                        "tertiary-container": "#a80b1d",
                        "primary-fixed": "#e9ddff",
                        "on-secondary": "#ffffff",
                        "tertiary": "#7f0011",
                        "secondary": "#006874",
                        "surface-container": "#eeeeee",
                        "on-surface": "#1a1c1c",
                        "surface-container-high": "#e8e8e8",
                        "on-tertiary-container": "#ffb4af",
                        "surface": "#f9f9f9",
                        "outline": "#7b7488",
                        "surface-variant": "#e2e2e2",
                        "on-tertiary": "#ffffff",
                        "secondary-fixed": "#98f0ff",
                        "on-background": "#1a1c1c",
                        "inverse-on-surface": "#f0f1f1",
                        "on-secondary-fixed": "#001f24",
                        "surface-tint": "#6e24f6",
                        "on-secondary-fixed-variant": "#004f58",
                        "surface-container-highest": "#e2e2e2",
                        "on-error-container": "#93000a",
                        "tertiary-fixed": "#ffdad7",
                        "on-secondary-container": "#006773",
                        "surface-bright": "#f9f9f9",
                        "on-primary-fixed-variant": "#5400cc",
                        "on-tertiary-fixed-variant": "#930015",
                        "secondary-fixed-dim": "#45d8ed"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    "spacing": {
                        "margin-desktop": "64px",
                        "sm": "12px",
                        "md": "24px",
                        "lg": "48px",
                        "gutter": "24px",
                        "xs": "4px",
                        "margin-mobile": "16px",
                        "xl": "80px",
                        "base": "8px"
                    },
                    "fontFamily": {
                        "headline-md": ["Lexend"],
                        "body-md": ["Lexend"],
                        "headline-lg": ["Lexend"],
                        "label-lg": ["Lexend"],
                        "body-lg": ["Lexend"],
                        "label-sm": ["Lexend"],
                        "display-lg": ["Lexend"]
                    },
                    "fontSize": {
                        "headline-md": ["24px", {"lineHeight": "1.3", "fontWeight": "600"}],
                        "body-md": ["16px", {"lineHeight": "1.5", "fontWeight": "400"}],
                        "headline-lg": ["32px", {"lineHeight": "1.2", "fontWeight": "700"}],
                        "label-lg": ["14px", {"lineHeight": "1.2", "letterSpacing": "0.05em", "fontWeight": "600"}],
                        "body-lg": ["18px", {"lineHeight": "1.6", "fontWeight": "400"}],
                        "label-sm": ["12px", {"lineHeight": "1.2", "fontWeight": "500"}],
                        "display-lg": ["64px", {"lineHeight": "1.1", "letterSpacing": "-0.02em", "fontWeight": "900"}]
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-background text-on-surface font-body-md min-h-screen pb-32 host-city-pattern">
<!-- Top Navigation -->
<header class="flex justify-between items-center px-margin-mobile h-20 w-full z-50 bg-surface-container-lowest border-b border-outline-variant sticky top-0">
<div class="flex items-center gap-base">
<div class="bg-primary p-2 rounded-lg text-on-primary">
<span class="material-symbols-outlined text-headline-md" data-icon="sports_soccer">sports_soccer</span>
</div>
<div class="flex flex-col -space-y-1">
<span class="text-[10px] font-bold tracking-[0.2em] text-primary uppercase">FIFA World Cup</span>
<h1 class="font-display-lg text-headline-md font-black text-on-surface tracking-tight">2026™</h1>
</div>
</div>
<div class="flex gap-sm">
<button class="hover:bg-surface-container-high transition-colors p-sm rounded-xl active:scale-95 duration-200">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</button>
<button class="hover:bg-surface-container-high transition-colors p-sm rounded-xl active:scale-95 duration-200">
<span class="material-symbols-outlined" data-icon="account_circle">account_circle</span>
</button>
</div>
</header>
<main class="px-margin-mobile pt-lg max-w-4xl mx-auto">
<!-- Progress Bar Section -->
<section class="mb-xl">
<div class="flex justify-between items-end mb-md">
<div>
<span class="font-label-lg text-primary uppercase tracking-widest text-[11px]">Huidige Ronde</span>
<h2 class="font-headline-lg text-headline-lg text-on-surface mt-1">Jouw Voorspellingen</h2>
</div>
<div class="text-right">
<span class="font-display-lg text-[32px] text-primary">6<span class="text-outline">/10</span></span>
</div>
</div>
<div class="w-full h-3 bg-surface-container-highest rounded-full overflow-hidden">
<div class="h-full bg-primary w-[60%] rounded-full transition-all duration-1000 ease-out"></div>
</div>
<p class="mt-sm text-on-surface-variant font-body-md text-sm">Nog 4 wedstrijden te gaan om je bonuspunten te verzilveren!</p>
</section>
<!-- Match List -->
<div class="space-y-md">
<!-- Match Card 1 (Predicted) -->
<article class="bg-surface-container-lowest rounded-2xl p-md border border-outline-variant shadow-sm relative transition-all hover:shadow-md">
<div class="absolute top-0 right-0 px-4 py-1 bg-secondary-fixed-dim text-on-secondary-fixed rounded-bl-2xl font-label-sm text-[10px] uppercase tracking-wider font-bold">VOORSPELD</div>
<div class="flex items-center justify-between mb-lg pt-4">
<div class="flex-1 text-center">
<div class="w-20 h-20 mx-auto mb-sm bg-surface-container-low rounded-2xl flex items-center justify-center p-1 border border-outline-variant shadow-inner overflow-hidden">
<img alt="Flag" class="w-full h-full object-cover rounded-xl" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDMH1nzQsDVddLbJ8yuyOrC0ywbzSSVNYptsH8e2KuZmZfjg4vMYW6h8s40i_0rwRz71clnzM7otfArufHmgE52_rF6Q9QoIn8TJjPYtkMSNeM69ozKOalOVApQGx4DU51aR2z3lUXIzAWVnxkIKL3XUQptSd5yChUaRmDFylFS-6mAF7Zfez1dm_Ivt-b3ORvZvY0suI_pmY91N0zkyHq4I6I5bPn9VU--1R0Tvncvp57KMJ5HGn2AHPPyR0nBzK4h1Tly7W5zsdTG"/>
</div>
<span class="font-headline-md text-sm uppercase tracking-wider">Nederland</span>
</div>
<div class="flex items-center gap-sm px-md">
<input class="w-16 h-20 text-center font-display-lg text-[32px] bg-surface-container-low border-2 border-transparent rounded-xl text-primary focus:border-primary focus:bg-white input-glow transition-all outline-none" placeholder="-" type="number" value="2"/>
<span class="text-outline font-bold text-xl">:</span>
<input class="w-16 h-20 text-center font-display-lg text-[32px] bg-surface-container-low border-2 border-transparent rounded-xl text-primary focus:border-primary focus:bg-white input-glow transition-all outline-none" placeholder="-" type="number" value="1"/>
</div>
<div class="flex-1 text-center">
<div class="w-20 h-20 mx-auto mb-sm bg-surface-container-low rounded-2xl flex items-center justify-center p-1 border border-outline-variant shadow-inner overflow-hidden">
<img alt="Flag" class="w-full h-full object-cover rounded-xl" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCG7Fy_lqkVao0g9r2dUe8hEf76Q3TEAREvrhbdKLHoOUw4lPjP6S62ClYgDR_I3nWpD21h5E7aQBUlUc-0L6TtgmZxs_A4bpfMAWrITtKKB1ZDuVRyROoa2Ogoqo4fc_GI6Vw7R5z5Q0187CEGBGooJQ7WNkx16Fx0RLAiH0wdpDjMR_65_BxxkMzNtMf5u1hcjDmH9n--CNXJJAHOIDrlFrtfQf25PLit5pFrz1L-SZ0ULVR7wd9gekLypcaYzNj_6CVhhCDJ-qPA"/>
</div>
<span class="font-headline-md text-sm uppercase tracking-wider">Senegal</span>
</div>
</div>
<div class="flex justify-between items-center bg-surface-container-lowest mt-4 pt-4 border-t border-outline-variant/30">
<div class="flex items-center gap-xs text-on-surface-variant">
<span class="material-symbols-outlined text-[18px]" data-icon="stadium">stadium</span>
<span class="font-label-sm text-[11px] text-outline font-medium">AL THUMAMA STADIUM • 24 NOV, 20:00</span>
</div>
<button class="bg-primary text-on-primary px-md py-base rounded-xl font-label-lg uppercase text-[12px] flex items-center gap-xs active:scale-95 transition-all shadow-lg shadow-primary/20">
<span class="material-symbols-outlined text-sm" data-icon="check_circle">check_circle</span>
                        Opslaan
                    </button>
</div>
</article>
<!-- Match Card 2 (Empty) -->
<article class="bg-surface-container-lowest rounded-2xl p-md border border-outline-variant shadow-sm relative transition-all hover:shadow-md">
<div class="flex items-center justify-between mb-lg pt-4">
<div class="flex-1 text-center">
<div class="w-20 h-20 mx-auto mb-sm bg-surface-container-low rounded-2xl flex items-center justify-center p-1 border border-outline-variant shadow-inner overflow-hidden">
<img alt="Flag" class="w-full h-full object-cover rounded-xl" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD0bsTLInBIMXSLJXdJlvmRwhTzeCdd_M0i5M41pD45Huf3EXOZ481jTcak69aqaiMZ4aOQ4J9MCTzy7SJPfIdVTaVd9GCCW07HNjTfqxIa0CKaCZSh6JDuF62jAlyRdbaJ3EyRTps9bio1eLCV0Rr_kThiDn-1szowr0Nox5vXZcU952rThEhpU0g8Os5pvwOQF-fX1U8vG8sphrkR5IxD1azb5V0gpKxWguIAcVn1wmO0zVm8lfXYt0BmArROnsuTNPbpGqdNwejc"/>
</div>
<span class="font-headline-md text-sm uppercase tracking-wider">Argentinië</span>
</div>
<div class="flex items-center gap-sm px-md">
<input class="w-16 h-20 text-center font-display-lg text-[32px] bg-surface-container-low border-2 border-transparent rounded-xl text-on-surface focus:border-primary focus:bg-white input-glow transition-all outline-none" placeholder="-" type="number"/>
<span class="text-outline font-bold text-xl">:</span>
<input class="w-16 h-20 text-center font-display-lg text-[32px] bg-surface-container-low border-2 border-transparent rounded-xl text-on-surface focus:border-primary focus:bg-white input-glow transition-all outline-none" placeholder="-" type="number"/>
</div>
<div class="flex-1 text-center">
<div class="w-20 h-20 mx-auto mb-sm bg-surface-container-low rounded-2xl flex items-center justify-center p-1 border border-outline-variant shadow-inner overflow-hidden">
<img alt="Flag" class="w-full h-full object-cover rounded-xl" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDTt0sLjm9txN4AblEq73BPnalbAiveOoXkpv1kZpC4G3Op-sHrMSDn2IMyKgdisVgVkuBXGjUklaLvMPFPITbingEUZWHYx1yXNbAXIwVh68BlPZ9zp8V7hvFJ4eOvbOd8ynFPWSPfF1NoZZnlXmnEIRi0jWTg7dV58vAqioacuaaQKWnNTqd0-Ex41kkQrLcvlZxVT1SaAUNw2GHh0s3VusLs8OmJgeRv7cI3nC164-RbTGIzF4lNTHTR5MyGThuBSCe7I8Kguimo"/>
</div>
<span class="font-headline-md text-sm uppercase tracking-wider">Saoedi-Arabië</span>
</div>
</div>
<div class="flex justify-between items-center bg-surface-container-lowest mt-4 pt-4 border-t border-outline-variant/30">
<div class="flex items-center gap-xs text-on-surface-variant">
<span class="material-symbols-outlined text-[18px]" data-icon="stadium">stadium</span>
<span class="font-label-sm text-[11px] text-outline font-medium">LUSAIL STADIUM • 25 NOV, 11:00</span>
</div>
<button class="bg-surface-container-high text-on-surface-variant px-md py-base rounded-xl font-label-lg uppercase text-[12px] flex items-center gap-xs active:scale-95 transition-all">
<span class="material-symbols-outlined text-sm" data-icon="save">save</span>
                        Opslaan
                    </button>
</div>
</article>
<!-- Match Card 3 (Empty) -->
<article class="bg-surface-container-lowest rounded-2xl p-md border border-outline-variant shadow-sm relative transition-all hover:shadow-md">
<div class="flex items-center justify-between mb-lg pt-4">
<div class="flex-1 text-center">
<div class="w-20 h-20 mx-auto mb-sm bg-surface-container-low rounded-2xl flex items-center justify-center p-1 border border-outline-variant shadow-inner overflow-hidden">
<img alt="Flag" class="w-full h-full object-cover rounded-xl" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVGs77NKh-KV06EY8npNK5BYInuNc9kvPDFgw4VIbG9DTc3Qy1AGY7hRMGfqtjbP5q4qwo3rjmi3xz6hNUySL3uXwGh3WceSxeqfn1uEwDugYKXBzYdLcz4qi86Fsq560sL37tzp8bc66nlOf9RtjcHWuJPUsGOqpSRgDHPtnw1vtQl8fr8PqIfFcRVvWqK3B8lzRAflhm99jbMb1kSkEhwBJes0oCGMoU14uUmt4pgQOFp2m02iulu99kEnW51vCbRI6I8Xc4CdAz"/>
</div>
<span class="font-headline-md text-sm uppercase tracking-wider">Frankrijk</span>
</div>
<div class="flex items-center gap-sm px-md">
<input class="w-16 h-20 text-center font-display-lg text-[32px] bg-surface-container-low border-2 border-transparent rounded-xl text-on-surface focus:border-primary focus:bg-white input-glow transition-all outline-none" placeholder="-" type="number"/>
<span class="text-outline font-bold text-xl">:</span>
<input class="w-16 h-20 text-center font-display-lg text-[32px] bg-surface-container-low border-2 border-transparent rounded-xl text-on-surface focus:border-primary focus:bg-white input-glow transition-all outline-none" placeholder="-" type="number"/>
</div>
<div class="flex-1 text-center">
<div class="w-20 h-20 mx-auto mb-sm bg-surface-container-low rounded-2xl flex items-center justify-center p-1 border border-outline-variant shadow-inner overflow-hidden">
<img alt="Flag" class="w-full h-full object-cover rounded-xl" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA_A0Kb3nwpSZvblKFp75PYUejbRoqK40x-ZDBtHpUY0u2PA6jUoxdJ7vRkLRmJ18Hom8PjmMyLiZYgXj8SjZg99vYF7GXj99hvN7Cm3A8DIdGtDHu4tf2xDNkuXxyExgZJXnLjl79CFvS8Q9-troAon72i04fIjB91le4kJd4ad2uzvbh2Fqp0jrGI3iXeeGDtgsCyWDyqgpunIKAIuPV9VjlVsr59KqPfeN8351SWR6S6Mr-QoDr83T7mTiKZw5IpwEDbe-2wRmM-"/>
</div>
<span class="font-headline-md text-sm uppercase tracking-wider">Australië</span>
</div>
</div>
<div class="flex justify-between items-center bg-surface-container-lowest mt-4 pt-4 border-t border-outline-variant/30">
<div class="flex items-center gap-xs text-on-surface-variant">
<span class="material-symbols-outlined text-[18px]" data-icon="stadium">stadium</span>
<span class="font-label-sm text-[11px] text-outline font-medium">AL JANOUB STADIUM • 25 NOV, 20:00</span>
</div>
<button class="bg-surface-container-high text-on-surface-variant px-md py-base rounded-xl font-label-lg uppercase text-[12px] flex items-center gap-xs active:scale-95 transition-all">
<span class="material-symbols-outlined text-sm" data-icon="save">save</span>
                        Opslaan
                    </button>
</div>
</article>
</div>
<!-- Sticky Submit Action -->
<div class="fixed bottom-24 left-0 w-full px-margin-mobile flex justify-center pointer-events-none">
<button class="pointer-events-auto bg-primary-container text-on-primary px-xl py-lg rounded-full font-headline-md uppercase shadow-xl shadow-primary/40 active:scale-95 transition-all flex items-center gap-md">
<span class="material-symbols-outlined" data-icon="send">send</span>
                Alle Voorspellingen Indienen
            </button>
</div>
</main>
<!-- Bottom Navigation Bar -->
<nav class="fixed bottom-0 left-0 w-full z-50 flex justify-around items-center px-4 pb-8 pt-4 bg-surface-container-lowest border-t border-outline-variant md:hidden">
<a class="flex flex-col items-center justify-center text-outline hover:text-primary transition-all active:scale-90" href="#">
<span class="material-symbols-outlined" data-icon="home">home</span>
<span class="font-label-sm text-[10px] mt-1">Home</span>
</a>
<a class="flex flex-col items-center justify-center text-primary active:scale-90" href="#">
<div class="bg-primary-fixed p-2 rounded-xl text-on-primary-fixed mb-1">
<span class="material-symbols-outlined" data-icon="edit_square" style="font-variation-settings: 'FILL' 1;">edit_square</span>
</div>
<span class="font-label-sm text-[10px] font-bold">Predict</span>
</a>
<a class="flex flex-col items-center justify-center text-outline hover:text-primary transition-all active:scale-90" href="#">
<span class="material-symbols-outlined" data-icon="leaderboard">leaderboard</span>
<span class="font-label-sm text-[10px] mt-1">Ranks</span>
</a>
<a class="flex flex-col items-center justify-center text-outline hover:text-primary transition-all active:scale-90" href="#">
<span class="material-symbols-outlined" data-icon="calendar_month">calendar_month</span>
<span class="font-label-sm text-[10px] mt-1">Matches</span>
</a>
</nav>
</body></html>