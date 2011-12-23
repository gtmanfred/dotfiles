/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-terminus-*-*-*-*-14-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#3E3E3E";
static const char normbgcolor[]     = "#B2D5EE";
static const char normfgcolor[]     = "#000000";
//static const char selbordercolor[]  = "#B2D5EE";
static const char selbordercolor[]  = "#000000";
static const char selbgcolor[]      = "#EAEFF2";
static const char selfgcolor[]      = "#000000";
/*static const char normbordercolor[] = "#0066ff";
static const char normbgcolor[]     = "#cccccc";
static const char normfgcolor[]     = "#000000";
static const char selbordercolor[]  = "#000000";
static const char selbgcolor[]      = "#0066ff";
static const char selfgcolor[]      = "#ffffff";*/

static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = False;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */
static const Bool viewontag         = False;     /* Switch view on tag switch */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            True,        -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       False,       -1 },
	{ "feh",  NULL,       NULL,       0,       True,       -1 },
	{ "zgv-sdl",  NULL,       NULL,       0,       True,       -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const Bool resizehints = False;  /* True means respect size hints in tiled resizals */

/*#include "bstack.c"
#include "bstackhoriz.c"*/
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};


/*{ "===",      bstackhoriz },
    { "TTT",      bstack },*/

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvt", NULL };
static const char *browser[] = { "luakit", NULL };
static const char *browserq[] = { "chromium", "-incognito", NULL };
static const char *email[] = { "chromium", "--app=https://mail.google.com", NULL };
static const char *slock[] = { "slock", NULL };
static const char *screenshot[] = { "import"," -window", "root ~/Pictures/`date '+%Y%m%d-%H%M%S'`.png" };
static const char *music[] = { "mplayer", "-e", "ncmpcpp", NULL };
static const char *musicn[] = { "ncmpcpp", "next", NULL };
static const char *musicp[] = { "ncmpcpp", "prev", NULL };
static const char *musict[] = { "ncmpcpp", "toggle", NULL };
static const char *cal[] = { "chromium", "--app=https://calendar.google.com", NULL };
static const char *voice[] = { "chromium", "--app=https://voice.google.com", NULL };
static const char *office[] = { "soffice", NULL };
static const char *docs[] = { "chromium", "--app=https://docs.google.com", NULL };
static const char *groups[] = { "chromium", "--app=https://groups.google.com", NULL };
static const char *twitter[] = { "chromium", "--app=https://twitter.com", NULL };
static const char *fbook[] = { "chromium", "--app=https://facebook.com", NULL };
static const char *food[] = { "chromium", "--app=http://www.weightwatchers.com/plan/mgr/PlanManager.aspx?deepLink=deepLinkToFoodTracker", NULL };
static const char *euler[] = { "chromium", "--app=http://projecteuler.net/index.php?section=problems", NULL };
static const char *logmein[] = { "chromium", "--app=https://www.logmein.com", NULL };
static const char *mu[] = { "chromium", "--app=http://$homeip:33812/gui/", NULL };
static const char *plus[] = { "chromium", "--app=https://plus.google.com", NULL };
static const char *amazon[] = { "chromium", "--app=https://www.amazon.com/gp/dmusic/mp3/player", NULL };




static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_c,      spawn,          {.v = browser } },
	{ MODKEY,                       XK_q,      spawn,          {.v = browserq } },
	{ MODKEY,                       XK_e,      spawn,          {.v = email } },
	{ MODKEY|ShiftMask,             XK_z,      spawn,          {.v = slock } },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          {.v = music } },
	{ MODKEY,                       XK_n,      spawn,          {.v = musicn } },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          {.v = musicp } },
	{ MODKEY,                       XK_b,      spawn,          {.v = musict } },
	{ MODKEY,                       XK_r,      spawn,          {.v = cal } },
	{ MODKEY,                       XK_v,      spawn,          {.v = voice } },
	{ MODKEY,                       XK_o,      spawn,          {.v = office } },
	{ MODKEY,                       XK_d,      spawn,          {.v = docs } },
	{ MODKEY,                       XK_g,      spawn,          {.v = groups } },
	{ MODKEY|ShiftMask,             XK_t,      spawn,          {.v = twitter } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = screenshot } },
	{ MODKEY,                       XK_f,      spawn,          {.v = fbook } },
	{ MODKEY,                       XK_w,      spawn,          {.v = food } },
	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = euler } },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = logmein } },
	{ MODKEY,                       XK_u,      spawn,          {.v = mu } },
	{ MODKEY,                       XK_p,      spawn,          {.v = plus } },
	{ MODKEY,                       XK_a,      spawn,          {.v = amazon } },

	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,			            XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_z,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_v,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

