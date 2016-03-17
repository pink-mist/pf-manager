--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: phrases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE phrases (
    id integer NOT NULL,
    phrase text NOT NULL,
    link text
);


--
-- Name: phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE phrases_id_seq OWNED BY phrases.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY phrases ALTER COLUMN id SET DEFAULT nextval('phrases_id_seq'::regclass);


--
-- Data for Name: phrases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY phrases (id, phrase, link) FROM stdin;
1	Will	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Will
2	Intelligence	https://sites.google.com/site/pathfinderogc/basics-ability-scores/ability-scores#TOC-Intelligence-Int-
3178	Bleed spell	/spells/Bleed
4	immediate action	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Immediate-Actions
5	Reflex	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Reflex
6	Fortitude	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Fortitude
7	Wisdom	https://sites.google.com/site/pathfinderogc/basics-ability-scores/ability-scores#TOC-Wisdom-Wis-
8	Charisma	https://sites.google.com/site/pathfinderogc/basics-ability-scores/ability-scores#TOC-Charisma-Cha-
9	Strength	https://sites.google.com/site/pathfinderogc/basics-ability-scores/ability-scores#TOC-Strength-Str-
10	Dexterity	https://sites.google.com/site/pathfinderogc/basics-ability-scores/ability-scores#TOC-Dexterity-Dex-
11	Constitution	https://sites.google.com/site/pathfinderogc/basics-ability-scores/ability-scores#TOC-Constitution-Con-
12	standard action	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Standard-Actions
13	move action	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Move-Actions
14	full-round action	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Full-Round-Actions
15	swift action	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Swift-Actions
16	free action	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Free-Actions
3179	Divination spell	/spells/Divination
18	Bleed	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Bleed
20	Blinded	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Blinded
21	Broken	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Broken
22	Confused	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Confused
23	Cowering	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Cowering
24	Dazed	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Dazed
25	Dazzled	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Dazed
26	Dead	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Dead
27	Deafened	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Deafened
28	Disabled	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Disabled
29	Dying	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Dying
30	Energy Drained	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Energy-Drained
31	Entangled	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Entangled
32	Exhausted	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Exhausted
33	Fascinated	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Fascinated
34	Fatigued	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Fatigued
35	Flat-Footed	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Flat-Footed
36	Frightened	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Frightened
37	Grappled	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Grappled
38	Helpless	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Helpless
39	Incorporeal	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Incorporeal
40	Invisible	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Invisible
41	Nauseated	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Nauseated
42	Panicked	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Panicked
43	Paralyzed	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Paralyzed
44	Petrified	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Petrified
45	Pinned	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Pinned
46	Prone	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Prone
47	Shaken	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Shaken
3180	Fly spell	/spells/Fly
50	Sickened	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Sickened
51	Sinking	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Sinking
52	Stable	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Stable
53	Staggered	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Staggered
54	Stunned	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Stunned
55	Unconscious	https://sites.google.com/site/pathfinderogc/gamemastering/conditions#TOC-Unconscious
56	critical hit	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Critical-Hits
57	critical hits	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Critical-Hits
58	sneak attack	https://sites.google.com/site/pathfinderogc/classes/core-classes/rogue#TOC-Sneak-Attack
59	spell resistance	https://sites.google.com/site/pathfinderogc/gamemastering/special-abilities#TOC-Spell-Resistance
60	combat maneuver	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Combat-Maneuvers
62	disarm	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Disarm
63	bull rush	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Bull-Rush
64	dirty trick	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Dirty-Trick
65	drag	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Drag
66	grapple	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Grapple
17	5-foot step	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Take-5-Foot-Step
67	overrun	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Overrun
68	reposition	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Overrun
69	steal	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Steal
70	sunder	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Sunder
71	trip	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Trip
72	aid another	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Aid-Another
73	charge	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Charge
74	feint	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Feint
75	delay	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Delay
76	ready	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Ready
77	attack of opportunity	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Attacks-of-Opportunity
3181	Heal spell	/spells/Heal
79	Knowledge	https://sites.google.com/site/pathfinderogc/skills/knowledge
80	Acrobatics	https://sites.google.com/site/pathfinderogc/skills/acrobatics
81	Appraise	https://sites.google.com/site/pathfinderogc/skills/appraise
82	Bluff	https://sites.google.com/site/pathfinderogc/skills/bluff
83	Climb	https://sites.google.com/site/pathfinderogc/skills/climb
84	Craft	https://sites.google.com/site/pathfinderogc/skills/craft
85	Diplomacy	https://sites.google.com/site/pathfinderogc/skills/diplomacy
87	Disable Device	https://sites.google.com/site/pathfinderogc/skills/disable-device
88	Disguise	https://sites.google.com/site/pathfinderogc/skills/disguise
89	Escape Artist	https://sites.google.com/site/pathfinderogc/skills/escape-artist
90	Fly	https://sites.google.com/site/pathfinderogc/skills/fly
91	Handle Animal	https://sites.google.com/site/pathfinderogc/skills/handle-animal
92	Heal	https://sites.google.com/site/pathfinderogc/skills/heal
93	Intimidate	https://sites.google.com/site/pathfinderogc/skills/intimidate
95	Linguistics	https://sites.google.com/site/pathfinderogc/skills/linguistics
96	Perception	https://sites.google.com/site/pathfinderogc/skills/perception
97	Perform	https://sites.google.com/site/pathfinderogc/skills/perform
98	Profession	https://sites.google.com/site/pathfinderogc/skills/profession
99	Ride	https://sites.google.com/site/pathfinderogc/skills/ride
100	Sense Motive	https://sites.google.com/site/pathfinderogc/skills/sense-motive
102	Sleight of Hand	https://sites.google.com/site/pathfinderogc/skills/sleight-of-hand
103	Spellcraft	https://sites.google.com/site/pathfinderogc/skills/spellcraft
104	Stealth	https://sites.google.com/site/pathfinderogc/skills/stealth
105	Survival	https://sites.google.com/site/pathfinderogc/skills/survival
106	Swim	https://sites.google.com/site/pathfinderogc/skills/swim
107	Use Magic Device	https://sites.google.com/site/pathfinderogc/skills/use-magic-device
109	attack roll	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Attack-Roll
110	attack rolls	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Attack-Roll
111	Concentration	https://sites.google.com/site/pathfinderogc/magic#TOC-Concentration
113	Abjuration	https://sites.google.com/site/pathfinderogc/magic#TOC-Abjuration
114	Conjuration	https://sites.google.com/site/pathfinderogc/magic#TOC-Conjuration
115	Divination	https://sites.google.com/site/pathfinderogc/magic#TOC-Divination
116	Enchantment	https://sites.google.com/site/pathfinderogc/magic#TOC-Enchantment
117	Evocation	https://sites.google.com/site/pathfinderogc/magic#TOC-Evocation
118	Illusion	https://sites.google.com/site/pathfinderogc/magic#TOC-Illusion
119	Necromancy	https://sites.google.com/site/pathfinderogc/magic#TOC-Necromancy
120	Transmutation	https://sites.google.com/site/pathfinderogc/magic#TOC-Transmutation
122	cover	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Cover
123	concealment	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Concealment
124	flanking	https://sites.google.com/site/pathfinderogc/gamemastering/combat#TOC-Flanking
125	diseased	https://sites.google.com/site/pathfinderogc/gamemastering/afflictions#TOC-Diseases
126	poisoned	https://sites.google.com/site/pathfinderogc/gamemastering/afflictions/poison
127	cursed	https://sites.google.com/site/pathfinderogc/gamemastering/afflictions/curses
839	Alarm	/spells/Alarm
832	Acid Arrow	/spells/Acid Arrow
833	Acid Fog	/spells/Acid Fog
834	Acid Splash	/spells/Acid Splash
835	Aid	/spells/Aid
836	Air Walk	/spells/Air Walk
837	Align Weapon	/spells/Align Weapon
838	Alter Self	/spells/Alter Self
840	Chill Touch	/spells/Chill Touch
841	Analyze Dweomer	/spells/Analyze Dweomer
842	Animal Growth	/spells/Animal Growth
843	Animal Messenger	/spells/Animal Messenger
844	Animal Shapes	/spells/Animal Shapes
845	Animal Trance	/spells/Animal Trance
846	Animate Dead	/spells/Animate Dead
847	Feather Step, Mass	/spells/Feather Step, Mass
848	Animate Objects	/spells/Animate Objects
849	Animate Plants	/spells/Animate Plants
850	Animate Rope	/spells/Animate Rope
851	Antilife Shell	/spells/Antilife Shell
852	Antimagic Field	/spells/Antimagic Field
853	Bestow Curse	/spells/Bestow Curse
854	Antipathy	/spells/Antipathy
855	Antiplant Shell	/spells/Antiplant Shell
856	Arcane Eye	/spells/Arcane Eye
857	Arcane Lock	/spells/Arcane Lock
858	Arcane Mark	/spells/Arcane Mark
859	Arcane Sight	/spells/Arcane Sight
860	Arcane Sight, Greater	/spells/Arcane Sight, Greater
861	Binding	/spells/Binding
862	Identify	/spells/Identify
863	Astral Projection	/spells/Astral Projection
864	Atonement	/spells/Atonement
865	Augury	/spells/Augury
866	Awaken	/spells/Awaken
867	Bane	/spells/Bane
868	Burning Hands	/spells/Burning Hands
869	Banishment	/spells/Banishment
870	Barkskin	/spells/Barkskin
871	Bear's Endurance	/spells/Bear's Endurance
872	Bear's Endurance, Mass	/spells/Bear's Endurance, Mass
873	Beast Shape I	/spells/Beast Shape I
874	Beast Shape II	/spells/Beast Shape II
875	Beast Shape III	/spells/Beast Shape III
876	Beast Shape IV	/spells/Beast Shape IV
877	Black Tentacles	/spells/Black Tentacles
878	Blade Barrier	/spells/Blade Barrier
879	Blasphemy	/spells/Blasphemy
880	Bless	/spells/Bless
881	Bless Water	/spells/Bless Water
882	Freedom	/spells/Freedom
883	Bless Weapon	/spells/Bless Weapon
884	Blight	/spells/Blight
885	Blindness/Deafness	/spells/Blindness/Deafness
886	Blink	/spells/Blink
887	Blur	/spells/Blur
888	Break Enchantment	/spells/Break Enchantment
889	Breath Of Life	/spells/Breath Of Life
890	Bull's Strength	/spells/Bull's Strength
891	Bull's Strength, Mass	/spells/Bull's Strength, Mass
892	Call Lightning	/spells/Call Lightning
893	Call Lightning Storm	/spells/Call Lightning Storm
894	Calm Animals	/spells/Calm Animals
895	Calm Emotions	/spells/Calm Emotions
896	Cat's Grace	/spells/Cat's Grace
897	Cat's Grace, Mass	/spells/Cat's Grace, Mass
898	Cause Fear	/spells/Cause Fear
899	Chain Lightning	/spells/Chain Lightning
900	Flare Burst	/spells/Flare Burst
901	Changestaff	/spells/Changestaff
902	Chaos Hammer	/spells/Chaos Hammer
903	Charm Person	/spells/Charm Person
904	Charm Animal	/spells/Charm Animal
905	Charm Monster	/spells/Charm Monster
906	Charm Monster, Mass	/spells/Charm Monster, Mass
907	Chill Metal	/spells/Chill Metal
908	Guidance	/spells/Guidance
909	Circle Of Death	/spells/Circle Of Death
910	Clairaudience/Clairvoyance	/spells/Clairaudience/Clairvoyance
911	Clenched Fist	/spells/Clenched Fist
912	Cloak of Chaos	/spells/Cloak of Chaos
913	Clone	/spells/Clone
914	Commune	/spells/Commune
915	Water Breathing	/spells/Water Breathing
916	Cloudkill	/spells/Cloudkill
917	Color Spray	/spells/Color Spray
918	Command	/spells/Command
919	Command, Greater	/spells/Command, Greater
920	Command Plants	/spells/Command Plants
921	Command Undead	/spells/Command Undead
922	Commune with Nature	/spells/Commune with Nature
923	Comprehend Languages	/spells/Comprehend Languages
924	Cone of Cold	/spells/Cone of Cold
925	Confusion	/spells/Confusion
926	Confusion, Lesser	/spells/Confusion, Lesser
927	Consecrate	/spells/Consecrate
928	Contact Other Plane	/spells/Contact Other Plane
929	Contagion	/spells/Contagion
930	Contingency	/spells/Contingency
931	Continual Flame	/spells/Continual Flame
932	Control Plants	/spells/Control Plants
933	Control Undead	/spells/Control Undead
934	Control Water	/spells/Control Water
935	Crushing Despair	/spells/Crushing Despair
936	Control Weather	/spells/Control Weather
937	Control Winds	/spells/Control Winds
938	Create Food and Water	/spells/Create Food and Water
939	Create Undead	/spells/Create Undead
940	Create Greater Undead	/spells/Create Greater Undead
941	Create Water	/spells/Create Water
942	Creeping Doom	/spells/Creeping Doom
943	Crushing Hand	/spells/Crushing Hand
944	Cure Light Wounds	/spells/Cure Light Wounds
945	Cure Critical Wounds	/spells/Cure Critical Wounds
946	Cure Light Wounds, Mass	/spells/Cure Light Wounds, Mass
947	Cure Critical Wounds, Mass	/spells/Cure Critical Wounds, Mass
948	Cure Moderate Wounds	/spells/Cure Moderate Wounds
949	Cure Moderate Wounds, Mass	/spells/Cure Moderate Wounds, Mass
950	Cure Serious Wounds	/spells/Cure Serious Wounds
951	Cure Serious Wounds, Mass	/spells/Cure Serious Wounds, Mass
952	Curse Water	/spells/Curse Water
953	Dancing Lights	/spells/Dancing Lights
954	Darkness	/spells/Darkness
955	Darkvision	/spells/Darkvision
956	Daylight	/spells/Daylight
957	Daze	/spells/Daze
958	Daze Monster	/spells/Daze Monster
959	Death Knell	/spells/Death Knell
960	Death Ward	/spells/Death Ward
961	Deathwatch	/spells/Deathwatch
962	Deeper Darkness	/spells/Deeper Darkness
963	Deep Slumber	/spells/Deep Slumber
964	Delayed Blast Fireball	/spells/Delayed Blast Fireball
965	Delay Poison	/spells/Delay Poison
966	Demand	/spells/Demand
967	Desecrate	/spells/Desecrate
968	Destruction	/spells/Destruction
969	Disrupting Weapon	/spells/Disrupting Weapon
970	Detect Animals or Plants	/spells/Detect Animals or Plants
971	Detect Chaos	/spells/Detect Chaos
972	Detect Evil	/spells/Detect Evil
973	Detect Good	/spells/Detect Good
974	Detect Law	/spells/Detect Law
975	Detect Magic	/spells/Detect Magic
976	Detect Poison	/spells/Detect Poison
977	Disrupt Undead	/spells/Disrupt Undead
978	Detect Scrying	/spells/Detect Scrying
979	Detect Secret Doors	/spells/Detect Secret Doors
980	Detect Snares and Pits	/spells/Detect Snares and Pits
981	Detect Thoughts	/spells/Detect Thoughts
982	Detect Undead	/spells/Detect Undead
983	Dictum	/spells/Dictum
984	Dimensional Anchor	/spells/Dimensional Anchor
985	Dimensional Lock	/spells/Dimensional Lock
986	Dimension Door	/spells/Dimension Door
987	Diminish Plants	/spells/Diminish Plants
988	Discern Lies	/spells/Discern Lies
989	Discern Location	/spells/Discern Location
990	Disguise Self	/spells/Disguise Self
991	Waves of Exhaustion	/spells/Waves of Exhaustion
992	Disintegrate	/spells/Disintegrate
993	Dismissal	/spells/Dismissal
994	Dispel Chaos	/spells/Dispel Chaos
995	Dispel Evil	/spells/Dispel Evil
996	Dispel Good	/spells/Dispel Good
997	Dispel Law	/spells/Dispel Law
998	Dispel Magic	/spells/Dispel Magic
999	Dispel Magic, Greater	/spells/Dispel Magic, Greater
1000	Displacement	/spells/Displacement
1001	Divine Favor	/spells/Divine Favor
1002	Divine Power	/spells/Divine Power
1003	Dominate Animal	/spells/Dominate Animal
1004	Dominate Monster	/spells/Dominate Monster
1005	Dominate Person	/spells/Dominate Person
1006	Doom	/spells/Doom
1007	Dream	/spells/Dream
1008	Eagle's Splendor	/spells/Eagle's Splendor
1009	Eagle's Splendor, Mass	/spells/Eagle's Splendor, Mass
1010	Earthquake	/spells/Earthquake
1011	Elemental Body I	/spells/Elemental Body I
1012	Elemental Body II	/spells/Elemental Body II
1013	Elemental Body III	/spells/Elemental Body III
1014	Elemental Body IV	/spells/Elemental Body IV
1015	Inflict Critical Wounds	/spells/Inflict Critical Wounds
1016	Elemental Swarm	/spells/Elemental Swarm
1017	Endure Elements	/spells/Endure Elements
1018	Energy Drain	/spells/Energy Drain
1019	Enervation	/spells/Enervation
1020	Enlarge Person	/spells/Enlarge Person
1021	Enlarge Person, Mass	/spells/Enlarge Person, Mass
1022	Explosive Runes	/spells/Explosive Runes
1023	Entangle	/spells/Entangle
1024	Enthrall	/spells/Enthrall
1025	Entropic Shield	/spells/Entropic Shield
1026	Erase	/spells/Erase
1027	Ethereal Jaunt	/spells/Ethereal Jaunt
1028	Etherealness	/spells/Etherealness
1029	Expeditious Retreat	/spells/Expeditious Retreat
1030	Eyebite	/spells/Eyebite
1031	Fabricate	/spells/Fabricate
1032	Faerie Fire	/spells/Faerie Fire
1033	False Life	/spells/False Life
1034	False Vision	/spells/False Vision
1035	Feather Fall	/spells/Feather Fall
1036	Feeblemind	/spells/Feeblemind
1037	Find the Path	/spells/Find the Path
1038	Find Traps	/spells/Find Traps
1039	Finger Of Death	/spells/Finger Of Death
1040	Fire Shield	/spells/Fire Shield
1041	Fire Seeds	/spells/Fire Seeds
1042	Flare	/spells/Flare
1043	Flesh to Stone	/spells/Flesh to Stone
1044	Fire Storm	/spells/Fire Storm
1045	Fire Trap	/spells/Fire Trap
1046	Fireball	/spells/Fireball
1047	Flame Arrow	/spells/Flame Arrow
1048	Flame Blade	/spells/Flame Blade
1049	Flame Strike	/spells/Flame Strike
1050	Flaming Sphere	/spells/Flaming Sphere
1051	Floating Disk	/spells/Floating Disk
1052	Fog Cloud	/spells/Fog Cloud
1053	Forbiddance	/spells/Forbiddance
1054	Forcecage	/spells/Forcecage
1055	Forceful Hand	/spells/Forceful Hand
1056	Foresight	/spells/Foresight
1057	Form of the Dragon I	/spells/Form of the Dragon I
1058	Form of the Dragon II	/spells/Form of the Dragon II
1059	Form of the Dragon III	/spells/Form of the Dragon III
1060	Fox's Cunning	/spells/Fox's Cunning
1061	Fox's Cunning, Mass	/spells/Fox's Cunning, Mass
1062	Freedom of Movement	/spells/Freedom of Movement
1063	Freezing Sphere	/spells/Freezing Sphere
1064	Gaseous Form	/spells/Gaseous Form
1065	Gate	/spells/Gate
1066	Geas/Quest	/spells/Geas/Quest
1067	Geas, Lesser	/spells/Geas, Lesser
1068	Gentle Repose	/spells/Gentle Repose
1069	Inflict Critical Wounds, Mass	/spells/Inflict Critical Wounds, Mass
1070	Ghost Sound	/spells/Ghost Sound
1071	Ghoul touch	/spells/Ghoul touch
1072	Giant Form I	/spells/Giant Form I
1073	Giant Form II	/spells/Giant Form II
1074	Giant Vermin	/spells/Giant Vermin
1075	Glibness	/spells/Glibness
1076	Glitterdust	/spells/Glitterdust
1077	Hide from Animals	/spells/Hide from Animals
1078	Globe of Invulnerability, Lesser	/spells/Globe of Invulnerability, Lesser
1079	Globe Of Invulnerability	/spells/Globe Of Invulnerability
1080	Glyph Of Warding	/spells/Glyph Of Warding
1081	Glyph of Warding, Greater	/spells/Glyph of Warding, Greater
1082	Goodberry	/spells/Goodberry
1083	Good Hope	/spells/Good Hope
1084	Grasping Hand	/spells/Grasping Hand
1085	Grease	/spells/Grease
1086	Guards and Wards	/spells/Guards and Wards
1087	Gust Of Wind	/spells/Gust Of Wind
1088	Hallow	/spells/Hallow
1089	Hallucinatory Terrain	/spells/Hallucinatory Terrain
1090	Halt Undead	/spells/Halt Undead
1091	Harm	/spells/Harm
1092	Haste	/spells/Haste
1093	Heal, Mass	/spells/Heal, Mass
1094	Heal Mount	/spells/Heal Mount
1095	Heat Metal	/spells/Heat Metal
1096	Helping Hand	/spells/Helping Hand
1097	Heroes' Feast	/spells/Heroes' Feast
1098	Heroism	/spells/Heroism
1099	Heroism, Greater	/spells/Heroism, Greater
1100	Hide from Undead	/spells/Hide from Undead
1101	Hideous Laughter	/spells/Hideous Laughter
1102	Hold Person	/spells/Hold Person
1103	Hold Monster	/spells/Hold Monster
1104	Hold Monster, Mass	/spells/Hold Monster, Mass
1105	Hold Person, Mass	/spells/Hold Person, Mass
1106	Hold Portal	/spells/Hold Portal
1107	Holy Aura	/spells/Holy Aura
1108	Holy Smite	/spells/Holy Smite
1109	Holy Sword	/spells/Holy Sword
1110	Holy Word	/spells/Holy Word
1111	Horrid Wilting	/spells/Horrid Wilting
1112	Hypnotic Pattern	/spells/Hypnotic Pattern
1113	Hypnotism	/spells/Hypnotism
1114	Ice Storm	/spells/Ice Storm
1115	Illusory Script	/spells/Illusory Script
1116	Illusory Wall	/spells/Illusory Wall
1117	Imbue with Spell Ability	/spells/Imbue with Spell Ability
1118	Implosion	/spells/Implosion
1119	Imprisonment	/spells/Imprisonment
1120	Incendiary Cloud	/spells/Incendiary Cloud
1121	Inflict Light Wounds	/spells/Inflict Light Wounds
1122	Inflict Light Wounds, Mass	/spells/Inflict Light Wounds, Mass
1123	Inflict Moderate Wounds	/spells/Inflict Moderate Wounds
1124	Inflict Moderate Wounds, Mass	/spells/Inflict Moderate Wounds, Mass
1125	Inflict Serious Wounds	/spells/Inflict Serious Wounds
1126	Inflict Serious Wounds, Mass	/spells/Inflict Serious Wounds, Mass
1127	Insanity	/spells/Insanity
1128	Interposing Hand	/spells/Interposing Hand
1129	Invisibility	/spells/Invisibility
1130	Invisibility, Greater	/spells/Invisibility, Greater
1131	Invisibility, Mass	/spells/Invisibility, Mass
1132	Invisibility Purge	/spells/Invisibility Purge
1133	Invisibility Sphere	/spells/Invisibility Sphere
1134	Iron Body	/spells/Iron Body
1135	Ironwood	/spells/Ironwood
1136	Irresistible Dance	/spells/Irresistible Dance
1137	Jump	/spells/Jump
1138	Keen Edge	/spells/Keen Edge
1139	Knock	/spells/Knock
1140	Know Direction	/spells/Know Direction
1141	Legend Lore	/spells/Legend Lore
1142	Levitate	/spells/Levitate
1143	Light	/spells/Light
1144	Lightning Bolt	/spells/Lightning Bolt
1145	Limited Wish	/spells/Limited Wish
1146	Liveoak	/spells/Liveoak
1147	Mage's Lucubration	/spells/Mage's Lucubration
1148	Locate Object	/spells/Locate Object
1149	Locate Creature	/spells/Locate Creature
1150	Longstrider	/spells/Longstrider
1151	Lullaby	/spells/Lullaby
1152	Mage Armor	/spells/Mage Armor
1153	Mage Hand	/spells/Mage Hand
1154	Mage's Disjunction	/spells/Mage's Disjunction
1155	Mage's Faithful Hound	/spells/Mage's Faithful Hound
1156	Mage's Magnificent Mansion	/spells/Mage's Magnificent Mansion
1157	Mage's Private Sanctum	/spells/Mage's Private Sanctum
1158	Mage's Sword	/spells/Mage's Sword
1159	Magic Aura	/spells/Magic Aura
1160	Magic Circle against Evil	/spells/Magic Circle against Evil
1161	Magic Circle against Chaos	/spells/Magic Circle against Chaos
1162	Magic Circle against Good	/spells/Magic Circle against Good
1163	Magic Circle against Law	/spells/Magic Circle against Law
1164	Magic Fang	/spells/Magic Fang
1165	Magic Fang, Greater	/spells/Magic Fang, Greater
1166	Magic Jar	/spells/Magic Jar
1167	Magic Missile	/spells/Magic Missile
1168	Magic Mouth	/spells/Magic Mouth
1169	Magic Stone	/spells/Magic Stone
1170	Magic Vestment	/spells/Magic Vestment
1171	Magic Weapon	/spells/Magic Weapon
1172	Minor Image	/spells/Minor Image
1173	Magic Weapon, Greater	/spells/Magic Weapon, Greater
1174	Minor Creation	/spells/Minor Creation
1175	Major Creation	/spells/Major Creation
1176	Major Image	/spells/Major Image
1177	Make Whole	/spells/Make Whole
1178	Mark of Justice	/spells/Mark of Justice
1179	Maze	/spells/Maze
1180	Pass without Trace	/spells/Pass without Trace
1181	Meld into Stone	/spells/Meld into Stone
1182	Mending	/spells/Mending
1183	Message	/spells/Message
1184	Meteor Swarm	/spells/Meteor Swarm
1185	Mind Blank	/spells/Mind Blank
1186	Mind Fog	/spells/Mind Fog
1187	Miracle	/spells/Miracle
1188	Mirage Arcana	/spells/Mirage Arcana
1189	Mirror Image	/spells/Mirror Image
1190	Misdirection	/spells/Misdirection
1191	Mislead	/spells/Mislead
1192	Remove Curse	/spells/Remove Curse
1193	Mnemonic Enhancer	/spells/Mnemonic Enhancer
1194	Modify Memory	/spells/Modify Memory
1195	Moment of Prescience	/spells/Moment of Prescience
1196	Mount	/spells/Mount
1197	Move Earth	/spells/Move Earth
1198	Neutralize Poison	/spells/Neutralize Poison
1199	Nightmare	/spells/Nightmare
1200	Waves of Fatigue	/spells/Waves of Fatigue
1201	Nondetection	/spells/Nondetection
1202	Obscure Object	/spells/Obscure Object
1203	Obscuring Mist	/spells/Obscuring Mist
1204	Open/Close	/spells/Open/Close
1205	Order's Wrath	/spells/Order's Wrath
1206	Overland Flight	/spells/Overland Flight
1207	Owl's Wisdom	/spells/Owl's Wisdom
1208	Owl's Wisdom, Mass	/spells/Owl's Wisdom, Mass
1209	Passwall	/spells/Passwall
1210	Thought Shield II	/spells/Thought Shield II
1211	Permanency	/spells/Permanency
1212	Permanent Image	/spells/Permanent Image
1213	Persistent Image	/spells/Persistent Image
1214	Phantasmal Killer	/spells/Phantasmal Killer
1215	Phantom Steed	/spells/Phantom Steed
1216	Phantom Trap	/spells/Phantom Trap
1217	Remove Disease	/spells/Remove Disease
1218	Phase Door	/spells/Phase Door
1219	Planar Ally, Lesser	/spells/Planar Ally, Lesser
1220	Planar Ally	/spells/Planar Ally
1221	Planar Ally, Greater	/spells/Planar Ally, Greater
1222	Planar Binding, Lesser	/spells/Planar Binding, Lesser
1223	Planar Binding	/spells/Planar Binding
1224	Planar Binding, Greater	/spells/Planar Binding, Greater
1225	Polymorph	/spells/Polymorph
1226	Plane Shift	/spells/Plane Shift
1227	Plant Growth	/spells/Plant Growth
1228	Plant Shape I	/spells/Plant Shape I
1229	Plant Shape II	/spells/Plant Shape II
1230	Plant Shape III	/spells/Plant Shape III
1231	Poison	/spells/Poison
1232	Polar Ray	/spells/Polar Ray
1233	Ray of Frost	/spells/Ray of Frost
1234	Wish	/spells/Wish
1235	Polymorph, Greater	/spells/Polymorph, Greater
1236	Polymorph Any Object	/spells/Polymorph Any Object
1237	Power Word Blind	/spells/Power Word Blind
1238	Power Word Kill	/spells/Power Word Kill
1239	Power Word Stun	/spells/Power Word Stun
1240	Prayer	/spells/Prayer
1241	Prestidigitation	/spells/Prestidigitation
1242	Stone Tell	/spells/Stone Tell
1243	Prismatic Sphere	/spells/Prismatic Sphere
1244	Prismatic Spray	/spells/Prismatic Spray
1245	Prismatic Wall	/spells/Prismatic Wall
1246	Prying Eyes, Greater	/spells/Prying Eyes, Greater
1247	Produce Flame	/spells/Produce Flame
1248	Programmed Image	/spells/Programmed Image
1249	Project Image	/spells/Project Image
1250	Protection From Arrows	/spells/Protection From Arrows
1251	Protection From Chaos	/spells/Protection From Chaos
1252	Protection From Evil	/spells/Protection From Evil
1253	Protection From Good	/spells/Protection From Good
1254	Protection From Law	/spells/Protection From Law
1255	Protection from Spells	/spells/Protection from Spells
1256	Purify Food and Drink	/spells/Purify Food and Drink
1257	Pyrotechnics	/spells/Pyrotechnics
1258	Quench	/spells/Quench
1259	Rage	/spells/Rage
1260	Rainbow Pattern	/spells/Rainbow Pattern
1261	Raise Dead	/spells/Raise Dead
1262	Ray Of Enfeeblement	/spells/Ray Of Enfeeblement
1263	Ray of Exhaustion	/spells/Ray of Exhaustion
1264	Read Magic	/spells/Read Magic
1265	Reduce Person	/spells/Reduce Person
1266	Reduce Animal	/spells/Reduce Animal
1267	Reduce Person, Mass	/spells/Reduce Person, Mass
1268	Refuge	/spells/Refuge
1269	Regenerate	/spells/Regenerate
1270	Reincarnate	/spells/Reincarnate
1271	Remove Blindness/Deafness	/spells/Remove Blindness/Deafness
1272	Summon Monster III	/spells/Summon Monster III
1273	Remove Fear	/spells/Remove Fear
1274	Remove Paralysis	/spells/Remove Paralysis
1275	Repel Metal or Stone	/spells/Repel Metal or Stone
1276	Repel Vermin	/spells/Repel Vermin
1277	Repel Wood	/spells/Repel Wood
1278	Repulsion	/spells/Repulsion
1279	Resilient Sphere	/spells/Resilient Sphere
1280	Resistance	/spells/Resistance
1281	Resist Energy	/spells/Resist Energy
1282	Restoration	/spells/Restoration
1283	Restoration, Greater	/spells/Restoration, Greater
1284	Restoration, Lesser	/spells/Restoration, Lesser
1285	Resurrection	/spells/Resurrection
1286	Reverse Gravity	/spells/Reverse Gravity
1287	Scorching Ray	/spells/Scorching Ray
1288	Righteous Might	/spells/Righteous Might
1289	Rope Trick	/spells/Rope Trick
1290	Rusting Grasp	/spells/Rusting Grasp
1291	Sanctuary	/spells/Sanctuary
1292	Scare	/spells/Scare
1293	Scintillating Pattern	/spells/Scintillating Pattern
1294	Screen	/spells/Screen
1295	Scrying	/spells/Scrying
1296	Scrying, Greater	/spells/Scrying, Greater
1297	Sculpt Sound	/spells/Sculpt Sound
1298	Searing Light	/spells/Searing Light
1299	Secret Chest	/spells/Secret Chest
1300	Speak with Plants	/spells/Speak with Plants
1301	Secret Page	/spells/Secret Page
1302	Secure Shelter	/spells/Secure Shelter
1303	See Invisibility	/spells/See Invisibility
1304	Seeming	/spells/Seeming
1305	Sending	/spells/Sending
1306	Sepia Snake Sigil	/spells/Sepia Snake Sigil
1307	Summon Monster IV	/spells/Summon Monster IV
1308	Summon Kami	/spells/Summon Kami
1309	Sequester	/spells/Sequester
1310	Shadow Conjuration	/spells/Shadow Conjuration
1311	Shades	/spells/Shades
1312	Shadow Conjuration, Greater	/spells/Shadow Conjuration, Greater
1313	Shadow Evocation	/spells/Shadow Evocation
1314	Shadow Evocation, Greater	/spells/Shadow Evocation, Greater
1315	Shadow Walk	/spells/Shadow Walk
1316	Summon Monster V	/spells/Summon Monster V
1317	Shambler	/spells/Shambler
1318	Shapechange	/spells/Shapechange
1319	Shatter	/spells/Shatter
1320	Shield	/spells/Shield
1321	Shield Of Faith	/spells/Shield Of Faith
1322	Shield of Law	/spells/Shield of Law
1323	Silence	/spells/Silence
1324	Shield Other	/spells/Shield Other
1325	Shillelagh	/spells/Shillelagh
1326	Shrink Item	/spells/Shrink Item
1327	Shocking Grasp	/spells/Shocking Grasp
1328	Shout	/spells/Shout
1329	Shout, Greater	/spells/Shout, Greater
1330	Summon Monster VI	/spells/Summon Monster VI
1331	Silent Image	/spells/Silent Image
1332	Simulacrum	/spells/Simulacrum
1333	Slay Living	/spells/Slay Living
1334	Sleep	/spells/Sleep
1335	Sleet Storm	/spells/Sleet Storm
1336	Slow	/spells/Slow
1337	Snare	/spells/Snare
1338	Soften Earth and Stone	/spells/Soften Earth and Stone
1339	Solid Fog	/spells/Solid Fog
1340	Song of Discord	/spells/Song of Discord
1341	Soul Bind	/spells/Soul Bind
1342	Sound Burst	/spells/Sound Burst
1343	Speak with Animals	/spells/Speak with Animals
1344	Speak with Dead	/spells/Speak with Dead
1345	Spectral Hand	/spells/Spectral Hand
1346	Spell Immunity	/spells/Spell Immunity
1347	Spell Immunity, Greater	/spells/Spell Immunity, Greater
1348	Spell Resistance	/spells/Spell Resistance
1349	Spellstaff	/spells/Spellstaff
1350	Spell Turning	/spells/Spell Turning
1351	Spider Climb	/spells/Spider Climb
1352	Stoneskin	/spells/Stoneskin
1353	Spike Growth	/spells/Spike Growth
1354	Spike Stones	/spells/Spike Stones
1355	Spiritual Weapon	/spells/Spiritual Weapon
1356	Stabilize	/spells/Stabilize
1357	Statue	/spells/Statue
1358	Status	/spells/Status
1359	Stinking Cloud	/spells/Stinking Cloud
1360	Stone Shape	/spells/Stone Shape
1361	Stone to Flesh	/spells/Stone to Flesh
1362	Storm Of Vengeance	/spells/Storm Of Vengeance
1363	Suggestion	/spells/Suggestion
1364	Suggestion, Mass	/spells/Suggestion, Mass
1365	Summon Instrument	/spells/Summon Instrument
1366	Summon Monster I	/spells/Summon Monster I
1367	Summon Monster II	/spells/Summon Monster II
1368	Summon Monster VIII	/spells/Summon Monster VIII
1369	Summon Monster VII	/spells/Summon Monster VII
1370	Summon Monster IX	/spells/Summon Monster IX
1371	Summon Nature's Ally I	/spells/Summon Nature's Ally I
1372	Summon Nature's Ally II	/spells/Summon Nature's Ally II
1373	Summon Nature's Ally III	/spells/Summon Nature's Ally III
1374	Summon Nature's Ally IV	/spells/Summon Nature's Ally IV
1375	Summon Nature's Ally V	/spells/Summon Nature's Ally V
1376	Summon Nature's Ally VI	/spells/Summon Nature's Ally VI
1377	Summon Nature's Ally VII	/spells/Summon Nature's Ally VII
1378	Summon Nature's Ally VIII	/spells/Summon Nature's Ally VIII
1379	Summon Nature's Ally IX	/spells/Summon Nature's Ally IX
1380	Symbol of Persuasion	/spells/Symbol of Persuasion
1381	Summon Swarm	/spells/Summon Swarm
1382	Sunbeam	/spells/Sunbeam
1383	Sunburst	/spells/Sunburst
1384	Symbol of Death	/spells/Symbol of Death
1385	Symbol of Fear	/spells/Symbol of Fear
1386	Symbol of Insanity	/spells/Symbol of Insanity
1387	Symbol of Pain	/spells/Symbol of Pain
1388	Wood Shape	/spells/Wood Shape
1389	Symbol of Sleep	/spells/Symbol of Sleep
1390	Symbol of Stunning	/spells/Symbol of Stunning
1391	Symbol Of Weakness	/spells/Symbol Of Weakness
1392	Sympathetic Vibration	/spells/Sympathetic Vibration
1393	Sympathy	/spells/Sympathy
1394	Telekinesis	/spells/Telekinesis
1395	Telekinetic Sphere	/spells/Telekinetic Sphere
1396	Sacrifice	/spells/Sacrifice
1397	Telepathic Bond	/spells/Telepathic Bond
1398	Teleport	/spells/Teleport
1399	Teleport, Greater	/spells/Teleport, Greater
1400	Teleport Object	/spells/Teleport Object
1401	Teleportation Circle	/spells/Teleportation Circle
1402	Temporal Stasis	/spells/Temporal Stasis
1403	Time Stop	/spells/Time Stop
1404	Water Walk	/spells/Water Walk
1405	Tiny Hut	/spells/Tiny Hut
1406	Tongues	/spells/Tongues
1407	Touch of Fatigue	/spells/Touch of Fatigue
1408	Touch of Idiocy	/spells/Touch of Idiocy
1409	Transformation	/spells/Transformation
1410	Transmute Metal to Wood	/spells/Transmute Metal to Wood
1411	Transmute Mud to Rock	/spells/Transmute Mud to Rock
1412	Unholy Aura	/spells/Unholy Aura
1413	Transmute Rock to Mud	/spells/Transmute Rock to Mud
1414	Transport via Plants	/spells/Transport via Plants
1415	Trap the Soul	/spells/Trap the Soul
1416	Tree Shape	/spells/Tree Shape
1417	Warp Wood	/spells/Warp Wood
1418	Tree Stride	/spells/Tree Stride
1419	True Resurrection	/spells/True Resurrection
1420	True Seeing	/spells/True Seeing
1421	True Strike	/spells/True Strike
1422	Undeath to Death	/spells/Undeath to Death
1423	Undetectable Alignment	/spells/Undetectable Alignment
1424	Unhallow	/spells/Unhallow
1425	Unholy Blight	/spells/Unholy Blight
1426	Unseen Servant	/spells/Unseen Servant
1427	Vampiric Touch	/spells/Vampiric Touch
1428	Veil	/spells/Veil
1429	Ventriloquism	/spells/Ventriloquism
1430	Virtue	/spells/Virtue
1431	Vision	/spells/Vision
1432	Wail of the Banshee	/spells/Wail of the Banshee
1433	Wall Of Fire	/spells/Wall Of Fire
1434	Wall Of Force	/spells/Wall Of Force
1435	Wall Of Ice	/spells/Wall Of Ice
1436	Wall of Iron	/spells/Wall of Iron
1437	Wall Of Thorns	/spells/Wall Of Thorns
1438	Web	/spells/Web
1439	Weird	/spells/Weird
1440	Whirlwind	/spells/Whirlwind
1441	Whispering Wind	/spells/Whispering Wind
1442	Wind Walk	/spells/Wind Walk
1443	Wind Wall	/spells/Wind Wall
1444	Word of Recall	/spells/Word of Recall
1445	Word Of Chaos	/spells/Word Of Chaos
1446	Zone of Silence	/spells/Zone of Silence
1447	Zone of Truth	/spells/Zone of Truth
1448	Wall Of Stone	/spells/Wall Of Stone
1449	Agonize	/spells/Agonize
1450	Hellfire Ray	/spells/Hellfire Ray
1451	Aura of the Unremarkable	/spells/Aura of the Unremarkable
1452	Burning Disarm	/spells/Burning Disarm
1453	Dirge Of The Victorious Knights	/spells/Dirge Of The Victorious Knights
1454	Dweomer Retaliation	/spells/Dweomer Retaliation
1455	Emergency Force Sphere	/spells/Emergency Force Sphere
1456	Signifer's Rally	/spells/Signifer's Rally
1457	Twine Double	/spells/Twine Double
1458	Fear	/spells/Fear
1459	Hold Animal	/spells/Hold Animal
1460	Insect Plague	/spells/Insect Plague
1461	Baleful Polymorph	/spells/Baleful Polymorph
1462	Prying Eyes	/spells/Prying Eyes
1463	Instant Summons	/spells/Instant Summons
1464	Spellcasting Contract, Lesser	/spells/Spellcasting Contract, Lesser
1465	Spellcasting Contract	/spells/Spellcasting Contract
1466	Inflict Pain, Mass	/spells/Inflict Pain, Mass
1467	Spellcasting Contract, Greater	/spells/Spellcasting Contract, Greater
1468	Ancestral Communion	/spells/Ancestral Communion
1469	Ancestral Gift	/spells/Ancestral Gift
1470	Summon Ancestral Guardian	/spells/Summon Ancestral Guardian
1471	See Through Stone	/spells/See Through Stone
1472	Rune of Durability	/spells/Rune of Durability
1473	Rune of Warding	/spells/Rune of Warding
1474	Detect Charm	/spells/Detect Charm
1475	Liberating Comand	/spells/Liberating Comand
1476	Suppres Charms and Compulsions	/spells/Suppres Charms and Compulsions
1477	Summon Flight of Eagles	/spells/Summon Flight of Eagles
1478	Mind Thrust III	/spells/Mind Thrust III
1479	Genius Avaricious	/spells/Genius Avaricious
1480	Protection from Energy	/spells/Protection from Energy
1481	Retrieve Item	/spells/Retrieve Item
1482	Spherescry	/spells/Spherescry
1483	Illusory Poison	/spells/Illusory Poison
1484	Arcane Reinforcement	/spells/Arcane Reinforcement
1485	Canopic Conversion	/spells/Canopic Conversion
1486	Chastise	/spells/Chastise
1487	Summon Elemental Steed	/spells/Summon Elemental Steed
1488	Hibernate	/spells/Hibernate
1489	Mark of Blood	/spells/Mark of Blood
1490	Sotto Voce	/spells/Sotto Voce
1491	Tomb Legion	/spells/Tomb Legion
1492	Tripvine	/spells/Tripvine
1493	Ape Walk	/spells/Ape Walk
1494	Defoliate	/spells/Defoliate
1495	Heatstroke	/spells/Heatstroke
1496	Swallow Your Fear	/spells/Swallow Your Fear
1497	Blood Rage	/spells/Blood Rage
1498	Shield the Banner	/spells/Shield the Banner
1499	Vigor	/spells/Vigor
1500	Absorbing Touch	/spells/Absorbing Touch
1501	Accelerate Poison	/spells/Accelerate Poison
1502	Acid Pit	/spells/Acid Pit
1503	Alchemical Allocation	/spells/Alchemical Allocation
1504	Allfood	/spells/Allfood
1505	Alter Winds	/spells/Alter Winds
1506	Amplify Elixir	/spells/Amplify Elixir
1507	Ant Haul	/spells/Ant Haul
1508	Aqueous Orb	/spells/Aqueous Orb
1509	Arcane Concordance	/spells/Arcane Concordance
1510	Arrow Eruption	/spells/Arrow Eruption
1511	Aspect of the Bear	/spells/Aspect of the Bear
1512	Aspect of the Falcon	/spells/Aspect of the Falcon
1513	Aspect of the Stag	/spells/Aspect of the Stag
1514	Astral Projection, Lesser	/spells/Astral Projection, Lesser
1515	Aspect of the Wolf	/spells/Aspect of the Wolf
1516	Aura of Greater Courage	/spells/Aura of Greater Courage
1517	Ball Lightning	/spells/Ball Lightning
1518	Banish Seeming	/spells/Banish Seeming
1519	Bard's Escape	/spells/Bard's Escape
1520	Beguiling Gift	/spells/Beguiling Gift
1521	Bestow Grace	/spells/Bestow Grace
1522	Blaze of Glory	/spells/Blaze of Glory
1523	Brand, Greater	/spells/Brand, Greater
1524	Blessing Of Fervor	/spells/Blessing Of Fervor
1525	Blessing of the Salamander	/spells/Blessing of the Salamander
1526	Blood Biography	/spells/Blood Biography
1527	Bloodhound	/spells/Bloodhound
1528	Bloody Claws	/spells/Bloody Claws
1529	Bomber's Eye	/spells/Bomber's Eye
1530	Borrow Fortune	/spells/Borrow Fortune
1531	Borrow Skill	/spells/Borrow Skill
1532	Bow Spirit	/spells/Bow Spirit
1533	Brand	/spells/Brand
1534	Break	/spells/Break
1535	Brilliant Inspiration	/spells/Brilliant Inspiration
1536	Bristle	/spells/Bristle
1537	Burning Gaze	/spells/Burning Gaze
1538	Burst Bonds	/spells/Burst Bonds
1539	Cacophonous Call	/spells/Cacophonous Call
1540	Cacophonous Call, Mass	/spells/Cacophonous Call, Mass
1541	Calcific Touch	/spells/Calcific Touch
1542	Deafening Song Bolt	/spells/Deafening Song Bolt
1543	Call Animal	/spells/Call Animal
1544	Campfire Wall	/spells/Campfire Wall
1545	Cast Out	/spells/Cast Out
1546	Castigate	/spells/Castigate
1547	Castigate, Mass	/spells/Castigate, Mass
1548	Challenge Evil	/spells/Challenge Evil
1549	Chameleon Stride	/spells/Chameleon Stride
1550	Coordinated Effort	/spells/Coordinated Effort
1551	Defile Armor	/spells/Defile Armor
1552	Clashing Rocks	/spells/Clashing Rocks
1553	Cleanse	/spells/Cleanse
1554	Cloak of Dreams	/spells/Cloak of Dreams
1555	Cloak of Shade	/spells/Cloak of Shade
1556	Cloak of Winds	/spells/Cloak of Winds
1557	Confess	/spells/Confess
1558	Contagious Flame	/spells/Contagious Flame
1559	Deadly Finale	/spells/Deadly Finale
1560	Corruption Resistance	/spells/Corruption Resistance
1561	Coward's Lament	/spells/Coward's Lament
1562	Crafter's Curse	/spells/Crafter's Curse
1563	Crafter's Fortune	/spells/Crafter's Fortune
1564	Create Pit	/spells/Create Pit
1565	Create Treasure Map	/spells/Create Treasure Map
1566	Cup Of Dust	/spells/Cup Of Dust
1567	Dancing Lantern	/spells/Dancing Lantern
1568	Deflection	/spells/Deflection
1569	Delayed Consumption	/spells/Delayed Consumption
1570	Denounce	/spells/Denounce
1571	Detect Aberration	/spells/Detect Aberration
1572	Detonate	/spells/Detonate
1573	Devolution	/spells/Devolution
1574	Discordant Blast	/spells/Discordant Blast
1575	Divine Transfer	/spells/Divine Transfer
1576	Fester	/spells/Fester
1577	Fester, Mass	/spells/Fester, Mass
1578	Divine Vessel	/spells/Divine Vessel
1579	Draconic Reservoir	/spells/Draconic Reservoir
1580	Dragon's Breath	/spells/Dragon's Breath
1581	Dust Of Twilight	/spells/Dust Of Twilight
1582	Eagle Eye	/spells/Eagle Eye
1583	Flames Of The Faithful	/spells/Flames Of The Faithful
1584	Elemental Aura	/spells/Elemental Aura
1585	Elemental Speech	/spells/Elemental Speech
1586	Elemental Touch	/spells/Elemental Touch
1587	Elude Time	/spells/Elude Time
1588	Enemy Hammer	/spells/Enemy Hammer
1589	Feast Of Ashes	/spells/Feast Of Ashes
1590	Enter Image	/spells/Enter Image
1591	Euphoric Tranquility	/spells/Euphoric Tranquility
1592	Evolution Surge, Lesser	/spells/Evolution Surge, Lesser
1593	Evolution Surge	/spells/Evolution Surge
1594	Evolution Surge, Greater	/spells/Evolution Surge, Greater
1595	Expeditious Excavation	/spells/Expeditious Excavation
1596	Expend	/spells/Expend
1597	Feather Step	/spells/Feather Step
1598	Fiery Body	/spells/Fiery Body
1599	Fire Breath	/spells/Fire Breath
1600	Fire of Entanglement	/spells/Fire of Entanglement
1601	Fire of Judgment	/spells/Fire of Judgment
1602	Fire of Vengeance	/spells/Fire of Vengeance
1603	Fire Snake	/spells/Fire Snake
1604	Firebrand	/spells/Firebrand
1605	Firefall	/spells/Firefall
1606	Fluid Form	/spells/Fluid Form
1607	Fly, Mass	/spells/Fly, Mass
1608	Foe to Friend	/spells/Foe to Friend
1609	Follow Aura	/spells/Follow Aura
1610	Fool's Forbiddance	/spells/Fool's Forbiddance
1611	Forced Repentance	/spells/Forced Repentance
1612	Frozen Note	/spells/Frozen Note
1613	Gallant Inspiration	/spells/Gallant Inspiration
1614	Getaway	/spells/Getaway
1615	Geyser	/spells/Geyser
1616	Ghostbane Dirge	/spells/Ghostbane Dirge
1617	Ghostbane Dirge, Mass	/spells/Ghostbane Dirge, Mass
1618	Glide	/spells/Glide
1619	Grace	/spells/Grace
1620	Gravity Bow	/spells/Gravity Bow
1621	Grove of Respite	/spells/Grove of Respite
1622	Guiding Star	/spells/Guiding Star
1623	Heroic Finale	/spells/Heroic Finale
1624	Hero's Defiance	/spells/Hero's Defiance
1625	Hidden Speech	/spells/Hidden Speech
1626	Hide Campsite	/spells/Hide Campsite
1627	Holy Whisper	/spells/Holy Whisper
1628	Honeyed Tongue	/spells/Honeyed Tongue
1629	Hungry Pit	/spells/Hungry Pit
1630	Hydraulic Push	/spells/Hydraulic Push
1631	Hydraulic Torrent	/spells/Hydraulic Torrent
1632	Pox Pustules	/spells/Pox Pustules
1633	Ill Omen	/spells/Ill Omen
1634	Innocence	/spells/Innocence
1635	Instant Armor	/spells/Instant Armor
1636	Instant Enemy	/spells/Instant Enemy
1637	Invigorate	/spells/Invigorate
1638	Invigorate, Mass	/spells/Invigorate, Mass
1639	Jester's Jaunt	/spells/Jester's Jaunt
1640	Keen Senses	/spells/Keen Senses
1641	King's Castle	/spells/King's Castle
1642	Knight's Calling	/spells/Knight's Calling
1643	Lead Blades	/spells/Lead Blades
1644	Life Bubble	/spells/Life Bubble
1645	Light Lance	/spells/Light Lance
1646	Lily Pad Stride	/spells/Lily Pad Stride
1647	Lockjaw	/spells/Lockjaw
1648	Marks Of Forbiddance	/spells/Marks Of Forbiddance
1649	Mask Dweomer	/spells/Mask Dweomer
1650	Memory Lapse	/spells/Memory Lapse
1651	Moonstruck	/spells/Moonstruck
1652	Nap Stack	/spells/Nap Stack
1653	Natural Rhythm	/spells/Natural Rhythm
1654	Nature's Exile	/spells/Nature's Exile
1655	Negate Aroma	/spells/Negate Aroma
1656	Oath Of Peace	/spells/Oath Of Peace
1657	Oracle's Burden	/spells/Oracle's Burden
1658	Pain Strike	/spells/Pain Strike
1659	Pain Strike, Mass	/spells/Pain Strike, Mass
1660	Paladin's Sacrifice	/spells/Paladin's Sacrifice
1661	Countless Eyes	/spells/Countless Eyes
1662	Phantasmal Revenge	/spells/Phantasmal Revenge
1663	Phantasmal Web	/spells/Phantasmal Web
1664	Pied Piping	/spells/Pied Piping
1665	Pillar Of Life	/spells/Pillar Of Life
1666	Planar Adaptation	/spells/Planar Adaptation
1667	Planar Adaptation, Mass	/spells/Planar Adaptation, Mass
1668	Rest Eternal	/spells/Rest Eternal
1669	Protective Spirit	/spells/Protective Spirit
1670	Purging Finale	/spells/Purging Finale
1671	Purified Calling	/spells/Purified Calling
1672	Putrefy Food and Drink	/spells/Putrefy Food and Drink
1673	Rally Point	/spells/Rally Point
1674	Rebuke	/spells/Rebuke
1675	Rampart	/spells/Rampart
1676	Rejuvenate Eidolon, Lesser	/spells/Rejuvenate Eidolon, Lesser
1677	Rejuvenate Eidolon	/spells/Rejuvenate Eidolon
1678	Rejuvenate Eidolon, Greater	/spells/Rejuvenate Eidolon, Greater
1679	Resounding Blow	/spells/Resounding Blow
1680	Restful Sleep	/spells/Restful Sleep
1681	Resurgent Transformation	/spells/Resurgent Transformation
1682	Retribution	/spells/Retribution
1683	Reviving Finale	/spells/Reviving Finale
1684	Righteous Vigor	/spells/Righteous Vigor
1685	River of Wind	/spells/River of Wind
1686	Sacred Bond	/spells/Sacred Bond
1687	Create Demiplane	/spells/Create Demiplane
1688	Sacrificial Oath	/spells/Sacrificial Oath
1689	Saddle Surge	/spells/Saddle Surge
1690	Sanctify Armor	/spells/Sanctify Armor
1691	Saving Finale	/spells/Saving Finale
1692	Scent Trail	/spells/Scent Trail
1693	Screech	/spells/Screech
1694	Sculpt Corpse	/spells/Sculpt Corpse
1695	Shifting Sand	/spells/Shifting Sand
1696	Seamantle	/spells/Seamantle
1697	Seek Thoughts	/spells/Seek Thoughts
1698	Share Language	/spells/Share Language
1699	Shadow Projection	/spells/Shadow Projection
1700	Share Senses	/spells/Share Senses
1701	Shared Wrath	/spells/Shared Wrath
1702	Sift	/spells/Sift
1703	Sirocco	/spells/Sirocco
1704	Sleepwalk	/spells/Sleepwalk
1705	Slipstream	/spells/Slipstream
1706	Snake Staff	/spells/Snake Staff
1707	Solid Note	/spells/Solid Note
1708	Spark	/spells/Spark
1709	Acidic Spray	/spells/Acidic Spray
1710	Spiked Pit	/spells/Spiked Pit
1711	Spiritual Ally	/spells/Spiritual Ally
1712	Spite	/spells/Spite
1713	Stay the Hand	/spells/Stay the Hand
1714	Stone Call	/spells/Stone Call
1715	Stone Fist	/spells/Stone Fist
1716	Stormbolts	/spells/Stormbolts
1717	Strong Jaw	/spells/Strong Jaw
1718	Acute Senses	/spells/Acute Senses
1719	Stumble Gap	/spells/Stumble Gap
1720	Stunning Finale	/spells/Stunning Finale
1721	Suffocation	/spells/Suffocation
1722	Suffocation, Mass	/spells/Suffocation, Mass
1723	Summon Eidolon	/spells/Summon Eidolon
1724	Swarm Skin	/spells/Swarm Skin
1725	Thorn Body	/spells/Thorn Body
1726	Ward the Faithful	/spells/Ward the Faithful
1727	Threefold Aspect	/spells/Threefold Aspect
1728	Thundering Drums	/spells/Thundering Drums
1729	Timely Inspiration	/spells/Timely Inspiration
1730	Tireless Pursuit	/spells/Tireless Pursuit
1731	Tireless Pursuers	/spells/Tireless Pursuers
1732	Touch of Gracelessness	/spells/Touch of Gracelessness
1733	Touch of the Sea	/spells/Touch of the Sea
1734	Transmogrify	/spells/Transmogrify
1735	Transmute Potion to Poison	/spells/Transmute Potion to Poison
1736	Weapon of Awe	/spells/Weapon of Awe
1737	Treasure Stitching	/spells/Treasure Stitching
1738	True Form	/spells/True Form
1739	Tsunami	/spells/Tsunami
1740	Twilight Knife	/spells/Twilight Knife
1741	Twin Form	/spells/Twin Form
1742	Create Demiplane, Lesser	/spells/Create Demiplane, Lesser
1743	Unfetter	/spells/Unfetter
1744	Universal Formula	/spells/Universal Formula
1745	Unwilling Shield	/spells/Unwilling Shield
1746	Unwitting Ally	/spells/Unwitting Ally
1747	Vanish	/spells/Vanish
1748	Veil of Positive Energy	/spells/Veil of Positive Energy
1749	Venomous Bolt	/spells/Venomous Bolt
1750	Versatile Weapon	/spells/Versatile Weapon
1751	Vomit Swarm	/spells/Vomit Swarm
1752	Age Resistance, Lesser	/spells/Age Resistance, Lesser
1753	Age Resistance, Greater	/spells/Age Resistance, Greater
1754	Vortex	/spells/Vortex
1755	Wake of Light	/spells/Wake of Light
1756	Wall of Lava	/spells/Wall of Lava
1757	Wall of Suppression	/spells/Wall of Suppression
1758	Wandering Star Motes	/spells/Wandering Star Motes
1759	Winds of Vengeance	/spells/Winds of Vengeance
1760	World Wave	/spells/World Wave
1761	Wrath	/spells/Wrath
1762	Wrathful Mantle	/spells/Wrathful Mantle
1763	Hunter's Eye	/spells/Hunter's Eye
1764	Hunter's Howl	/spells/Hunter's Howl
1765	Perceive Cues	/spells/Perceive Cues
1766	Residual Tracking	/spells/Residual Tracking
1767	Blessing of Courage and Life	/spells/Blessing of Courage and Life
1768	Lover's Vengeance	/spells/Lover's Vengeance
1769	Rift of Ruin	/spells/Rift of Ruin
1770	Constricting Coils	/spells/Constricting Coils
1771	Ancestral Memory	/spells/Ancestral Memory
1772	Gorum's Armor	/spells/Gorum's Armor
1773	Harrowing	/spells/Harrowing
1774	Infernal Healing	/spells/Infernal Healing
1775	Infernal Healing, Greater	/spells/Infernal Healing, Greater
1776	Age Resistance	/spells/Age Resistance
1777	Shield Of The Dawnflower	/spells/Shield Of The Dawnflower
1778	Teleport Trap	/spells/Teleport Trap
1779	Unbreakable Heart	/spells/Unbreakable Heart
1780	Vision of Lamashtu	/spells/Vision of Lamashtu
1781	Waters Of Lamashtu	/spells/Waters Of Lamashtu
1782	Trail of the Rose	/spells/Trail of the Rose
1783	Ash Storm	/spells/Ash Storm
1784	Allegro	/spells/Allegro
1785	Animate Dead, Lesser	/spells/Animate Dead, Lesser
1786	Anthropomorphic Animal	/spells/Anthropomorphic Animal
1787	Anticipate Peril	/spells/Anticipate Peril
1788	Arboreal Hammer	/spells/Arboreal Hammer
1789	Arcana Theft	/spells/Arcana Theft
1790	Archon's Aura	/spells/Archon's Aura
1791	Arrow of Law	/spells/Arrow of Law
1792	Atavism	/spells/Atavism
1793	Atavism, Mass	/spells/Atavism, Mass
1794	Aura of Doom	/spells/Aura of Doom
1795	Badger's Ferocity	/spells/Badger's Ferocity
1796	Battlemind Link	/spells/Battlemind Link
1797	Bestow Grace of the Champion	/spells/Bestow Grace of the Champion
1798	Blade of Bright Victory	/spells/Blade of Bright Victory
1799	Blade of Dark Triumph	/spells/Blade of Dark Triumph
1800	Blessing of the Mole	/spells/Blessing of the Mole
1801	Blood Crow Strike	/spells/Blood Crow Strike
1802	Protection from Good, Communal	/spells/Protection from Good, Communal
1803	Blood Mist	/spells/Blood Mist
1804	Blood Transcription	/spells/Blood Transcription
1805	Boiling Blood	/spells/Boiling Blood
1806	Bungle	/spells/Bungle
1807	Burrow	/spells/Burrow
1808	Burst of Nettles	/spells/Burst of Nettles
1809	Cackling Skull	/spells/Cackling Skull
1810	Call Construct	/spells/Call Construct
1811	Cape Of Wasps	/spells/Cape Of Wasps
1812	Caustic Eruption	/spells/Caustic Eruption
1813	Chord Of Shards	/spells/Chord Of Shards
1814	Circle Of Clarity	/spells/Circle Of Clarity
1815	Cold Ice Strike	/spells/Cold Ice Strike
1816	Compassionate Ally	/spells/Compassionate Ally
1817	Conjure Black Pudding	/spells/Conjure Black Pudding
1818	Contagion, Greater	/spells/Contagion, Greater
1819	Control Construct	/spells/Control Construct
1820	Control Summoned Creature	/spells/Control Summoned Creature
1821	Corrosive Consumption	/spells/Corrosive Consumption
1822	Corrosive Touch	/spells/Corrosive Touch
1823	Create Demiplane, Greater	/spells/Create Demiplane, Greater
1824	Curse, Major	/spells/Curse, Major
1825	Curse Of Disgust	/spells/Curse Of Disgust
1826	Curse of Magic Negation	/spells/Curse of Magic Negation
1827	Cursed Earth	/spells/Cursed Earth
1828	Cushioning Bands	/spells/Cushioning Bands
1829	Dance of a Hundred Cuts	/spells/Dance of a Hundred Cuts
1830	Dance of a Thousand Cuts	/spells/Dance of a Thousand Cuts
1831	Darkvision, Greater	/spells/Darkvision, Greater
1832	Daze, Mass	/spells/Daze, Mass
1833	Decompose Corpse	/spells/Decompose Corpse
1834	Defensive Shock	/spells/Defensive Shock
1835	Delay Pain	/spells/Delay Pain
1836	Delusional Pride	/spells/Delusional Pride
1837	Diagnose Disease	/spells/Diagnose Disease
1838	Disfiguring Touch	/spells/Disfiguring Touch
1839	Disguise Other	/spells/Disguise Other
1840	Distracting Cacophony	/spells/Distracting Cacophony
1841	Distressing Tone	/spells/Distressing Tone
1842	Divine Pursuit	/spells/Divine Pursuit
1843	Dread Bolt	/spells/Dread Bolt
1844	Eagle Aerie	/spells/Eagle Aerie
1845	Ear-Piercing Scream	/spells/Ear-Piercing Scream
1846	Echolocation	/spells/Echolocation
1847	Eldritch Fever	/spells/Eldritch Fever
1848	Envious Urge	/spells/Envious Urge
1849	Epidemic	/spells/Epidemic
1850	Eruptive Pustules	/spells/Eruptive Pustules
1851	Excruciating Deformation	/spells/Excruciating Deformation
1852	Exquisite Accompaniment	/spells/Exquisite Accompaniment
1853	False Life, Greater	/spells/False Life, Greater
1854	Forced Quiet	/spells/Forced Quiet
1855	Frigid Touch	/spells/Frigid Touch
1856	Familiar Melding	/spells/Familiar Melding
1857	Fickle Winds	/spells/Fickle Winds
1858	Fleshworm Infestation	/spells/Fleshworm Infestation
1859	Forbid Action	/spells/Forbid Action
1860	Forbid Action, Greater	/spells/Forbid Action, Greater
1861	Force Hook Charge	/spells/Force Hook Charge
1862	Force Punch	/spells/Force Punch
1863	Frostbite	/spells/Frostbite
1864	Fumbletongue	/spells/Fumbletongue
1865	Fungal Infestation	/spells/Fungal Infestation
1866	Ghostly Disguise	/spells/Ghostly Disguise
1867	Haunting Choir	/spells/Haunting Choir
1868	Haunting Mists	/spells/Haunting Mists
1869	Hex Ward	/spells/Hex Ward
1870	Holy Ice	/spells/Holy Ice
1871	Interplanetary Teleport	/spells/Interplanetary Teleport
1872	Holy Shield	/spells/Holy Shield
1873	Horn of Pursuit	/spells/Horn of Pursuit
1874	Howling Agony	/spells/Howling Agony
1875	Ice Body	/spells/Ice Body
1876	Ice Crystal Teleport	/spells/Ice Crystal Teleport
1877	Icicle Dagger	/spells/Icicle Dagger
1878	Icy Prison	/spells/Icy Prison
1879	Icy Prison, Mass	/spells/Icy Prison, Mass
1880	Imbue with Aura	/spells/Imbue with Aura
1881	Interrogation	/spells/Interrogation
1882	Interrogation, Greater	/spells/Interrogation, Greater
1883	Joyful Rapture	/spells/Joyful Rapture
1884	Ki Arrow	/spells/Ki Arrow
1885	Ki Leech	/spells/Ki Leech
1886	Ki Shout	/spells/Ki Shout
1887	Know The Enemy	/spells/Know The Enemy
1888	Leashed Shackles	/spells/Leashed Shackles
1889	Lend Judgment	/spells/Lend Judgment
1890	Lend Judgment, Greater	/spells/Lend Judgment, Greater
1891	Lightning Arc	/spells/Lightning Arc
1892	Remove Sickness	/spells/Remove Sickness
1893	Loathsome Veil	/spells/Loathsome Veil
1894	Lunar Veil	/spells/Lunar Veil
1895	Mad Hallucination	/spells/Mad Hallucination
1896	Mad Monkeys	/spells/Mad Monkeys
1897	Malfunction	/spells/Malfunction
1898	Malicious Spite	/spells/Malicious Spite
1899	Marionette Possession	/spells/Marionette Possession
1900	Masterwork Transformation	/spells/Masterwork Transformation
1901	Miserable Pity	/spells/Miserable Pity
1902	Monstrous Physique I	/spells/Monstrous Physique I
1903	Monstrous Physique II	/spells/Monstrous Physique II
1904	Monstrous Physique III	/spells/Monstrous Physique III
1905	Inner Focus	/spells/Inner Focus
1906	Monstrous Physique IV	/spells/Monstrous Physique IV
1907	Murderous Command	/spells/Murderous Command
1908	Oppressive Boredom	/spells/Oppressive Boredom
1909	Oracle's Vessel	/spells/Oracle's Vessel
1910	Orb Of The Void	/spells/Orb Of The Void
1911	Overwhelming Grief	/spells/Overwhelming Grief
1912	Toxic Gift	/spells/Toxic Gift
1913	Mind Thrust IV	/spells/Mind Thrust IV
1914	Overwhelming Presence	/spells/Overwhelming Presence
1915	Pernicious Poison	/spells/Pernicious Poison
1916	Persuasive Goad	/spells/Persuasive Goad
1917	Piercing Shriek	/spells/Piercing Shriek
1918	Plague Carrier	/spells/Plague Carrier
1919	Plague Storm	/spells/Plague Storm
1920	Play Instrument	/spells/Play Instrument
1921	Polar Midnight	/spells/Polar Midnight
1922	Symbol of Scrying	/spells/Symbol of Scrying
1923	Polypurpose Panacea	/spells/Polypurpose Panacea
1924	Possess Object	/spells/Possess Object
1925	Prediction of Failure	/spells/Prediction of Failure
1926	Primal Scream	/spells/Primal Scream
1927	Protective Penumbra	/spells/Protective Penumbra
1928	Rain of Frogs	/spells/Rain of Frogs
1929	Raise Animal Companion	/spells/Raise Animal Companion
1930	Rapid Repair	/spells/Rapid Repair
1931	Ray of Sickening	/spells/Ray of Sickening
1932	Reckless Infatuation	/spells/Reckless Infatuation
1933	Protection from Law, Communal	/spells/Protection from Law, Communal
1934	Reprobation	/spells/Reprobation
1935	Resonating Word	/spells/Resonating Word
1936	Restore Corpse	/spells/Restore Corpse
1937	Restore Eidolon	/spells/Restore Eidolon
1938	Restore Eidolon, Lesser	/spells/Restore Eidolon, Lesser
1939	Ride the Lightning	/spells/Ride the Lightning
1940	Ride The Waves	/spells/Ride The Waves
1941	Sanctify Corpse	/spells/Sanctify Corpse
1942	Sands of Time	/spells/Sands of Time
1943	Blade Lash	/spells/Blade Lash
1944	Scouring Winds	/spells/Scouring Winds
1945	Sculpt Simulacrum	/spells/Sculpt Simulacrum
1946	Serenity	/spells/Serenity
1947	Shadowbard	/spells/Shadowbard
1948	Shadow Step	/spells/Shadow Step
1949	Shadow Weapon	/spells/Shadow Weapon
1950	Shard of Chaos	/spells/Shard of Chaos
1951	Share Memory	/spells/Share Memory
1952	Simulacrum, Lesser	/spells/Simulacrum, Lesser
1953	Skinsend	/spells/Skinsend
1954	Smug Narcissism	/spells/Smug Narcissism
1955	Snapdragon Fireworks	/spells/Snapdragon Fireworks
1956	Sonic Thrust	/spells/Sonic Thrust
1957	Soothe Construct	/spells/Soothe Construct
1958	Spear Of Purity	/spells/Spear Of Purity
1959	Spit Venom	/spells/Spit Venom
1960	Steal Voice	/spells/Steal Voice
1961	Strangling Hair	/spells/Strangling Hair
1962	Summon Elder Worm	/spells/Summon Elder Worm
1963	Summon Froghemoth	/spells/Summon Froghemoth
1964	Summon Minor Ally	/spells/Summon Minor Ally
1965	Summon Minor Monster	/spells/Summon Minor Monster
1966	Surmount Affliction	/spells/Surmount Affliction
1967	Symbol of Healing	/spells/Symbol of Healing
1968	Symbol of Mirroring	/spells/Symbol of Mirroring
1969	Symbol of Revelation	/spells/Symbol of Revelation
1970	Deadeye's Lore	/spells/Deadeye's Lore
1971	Symbol of Sealing	/spells/Symbol of Sealing
1972	Symbol of Slowing	/spells/Symbol of Slowing
1973	Symbol of Strife	/spells/Symbol of Strife
1974	Symbol of Vulnerability	/spells/Symbol of Vulnerability
1975	Tar Ball	/spells/Tar Ball
1976	Temporary Resurrection	/spells/Temporary Resurrection
1977	Terrible Remorse	/spells/Terrible Remorse
1978	Touch of Slime	/spells/Touch of Slime
1979	Transmute Blood To Acid	/spells/Transmute Blood To Acid
1980	Unadulterated Loathing	/spells/Unadulterated Loathing
1981	Unbreakable Construct	/spells/Unbreakable Construct
1982	Undead Anatomy I	/spells/Undead Anatomy I
1983	Undead Anatomy II	/spells/Undead Anatomy II
1984	Undead Anatomy III	/spells/Undead Anatomy III
1985	Vermin Shape I	/spells/Vermin Shape I
1986	Undead Anatomy IV	/spells/Undead Anatomy IV
1987	Unholy Ice	/spells/Unholy Ice
1988	Unholy Sword	/spells/Unholy Sword
1989	Unnatural Lust	/spells/Unnatural Lust
1990	Unprepared Combatant	/spells/Unprepared Combatant
1991	Unshakable Chill	/spells/Unshakable Chill
1992	Utter Contempt	/spells/Utter Contempt
1993	Vengeful Outrage	/spells/Vengeful Outrage
1994	Spell Immunity, Greater Communal	/spells/Spell Immunity, Greater Communal
1995	Vermin Shape II	/spells/Vermin Shape II
1996	Vestment of the Champion	/spells/Vestment of the Champion
1997	Virtuoso Performance	/spells/Virtuoso Performance
1998	Vision of Hell	/spells/Vision of Hell
1999	Vitriolic Mist	/spells/Vitriolic Mist
2000	Vocal Alteration	/spells/Vocal Alteration
2001	Volcanic Storm	/spells/Volcanic Storm
2002	Wall of Sound	/spells/Wall of Sound
2003	Wartrain Mount	/spells/Wartrain Mount
2004	Waves of Ecstasy	/spells/Waves of Ecstasy
2005	Web Shelter	/spells/Web Shelter
2006	Witness	/spells/Witness
2007	Wooden Phalanx	/spells/Wooden Phalanx
2008	Word of Resolve	/spells/Word of Resolve
2009	Youthful Appearance	/spells/Youthful Appearance
2010	Staggering Fall	/spells/Staggering Fall
2011	Greensight	/spells/Greensight
2012	Sheet Lightning	/spells/Sheet Lightning
2013	Breeze	/spells/Breeze
2014	Drench	/spells/Drench
2015	Jolt	/spells/Jolt
2016	Penumbra	/spells/Penumbra
2017	Root	/spells/Root
2018	Scoop	/spells/Scoop
2019	Dazzling Blade	/spells/Dazzling Blade
2020	Dazzling Blade, Mass	/spells/Dazzling Blade, Mass
2021	Summon Accuser	/spells/Summon Accuser
2022	Summon Infernal Host	/spells/Summon Infernal Host
2023	Echean's Excellent Enclosure	/spells/Echean's Excellent Enclosure
2024	Ablative Sphere	/spells/Ablative Sphere
2025	Burning Arc	/spells/Burning Arc
2026	Cultural Adaptation	/spells/Cultural Adaptation
2027	Snow Shape	/spells/Snow Shape
2028	Summon Totem Creature	/spells/Summon Totem Creature
2029	Battering Blast	/spells/Battering Blast
2030	Litany Of Escape	/spells/Litany Of Escape
2031	Undeath Ward	/spells/Undeath Ward
2032	Silk To Steel	/spells/Silk To Steel
2033	Aram Zey's Focus	/spells/Aram Zey's Focus
2034	Aram Zey's Trap Ward	/spells/Aram Zey's Trap Ward
2035	Bite the Hand	/spells/Bite the Hand
2036	Bite the Hand, Mass	/spells/Bite the Hand, Mass
2037	Corpse Lanterns	/spells/Corpse Lanterns
2038	Gilded Whispers	/spells/Gilded Whispers
2039	Lipstitch	/spells/Lipstitch
2040	Petulengro's Validation	/spells/Petulengro's Validation
2041	Sequester Thoughts	/spells/Sequester Thoughts
2042	Sharesister	/spells/Sharesister
2043	Stalwart Resolve	/spells/Stalwart Resolve
2044	Bladed Dash	/spells/Bladed Dash
2045	Bladed Dash, Greater	/spells/Bladed Dash, Greater
2046	Stolen Light	/spells/Stolen Light
2047	Twisted Innards	/spells/Twisted Innards
2048	Blot	/spells/Blot
2049	Fire Sneeze	/spells/Fire Sneeze
2050	Limp Lash	/spells/Limp Lash
2051	Aroden's Spellbane	/spells/Aroden's Spellbane
2052	Spider Climb, Communal	/spells/Spider Climb, Communal
2053	Blast Barrier	/spells/Blast Barrier
2054	Call Weapon	/spells/Call Weapon
2055	Crusader's Edge	/spells/Crusader's Edge
2056	Eaglesoul	/spells/Eaglesoul
2057	Eldritch Conduit	/spells/Eldritch Conduit
2058	Eldritch Conduit, Greater	/spells/Eldritch Conduit, Greater
2059	Fleshcurdle	/spells/Fleshcurdle
2060	Forceful Strike	/spells/Forceful Strike
2061	Geb's Hammer	/spells/Geb's Hammer
2062	Geniekind	/spells/Geniekind
2063	Hungry Darkness	/spells/Hungry Darkness
2064	Hunter's Lore	/spells/Hunter's Lore
2065	Impart Mind	/spells/Impart Mind
2066	Khain's Army	/spells/Khain's Army
2067	Kiss of the First World	/spells/Kiss of the First World
2068	Light of Iomedae	/spells/Light of Iomedae
2069	Martial Marionette	/spells/Martial Marionette
2070	Martyr's Bargain	/spells/Martyr's Bargain
2071	Music of the Spheres	/spells/Music of the Spheres
2072	Orchid's Drop	/spells/Orchid's Drop
2073	Pugwampi's Grace	/spells/Pugwampi's Grace
2074	Shadow Barbs	/spells/Shadow Barbs
2075	Shining Cord	/spells/Shining Cord
2076	Siphon Magic	/spells/Siphon Magic
2077	Song of Kyonin	/spells/Song of Kyonin
2078	Spell Absorption	/spells/Spell Absorption
2079	Spell Absorption, Greater	/spells/Spell Absorption, Greater
2080	Spellscar	/spells/Spellscar
2081	Suppress Primal Magic	/spells/Suppress Primal Magic
2082	Tattoo Potion	/spells/Tattoo Potion
2083	Transfer Tattoo	/spells/Transfer Tattoo
2084	Vengeful Comets	/spells/Vengeful Comets
2085	Vex Giant	/spells/Vex Giant
2086	Weaponwand	/spells/Weaponwand
2087	Zone of Foul Flames	/spells/Zone of Foul Flames
2088	Ablative Barrier	/spells/Ablative Barrier
2089	Absorb Toxicity	/spells/Absorb Toxicity
2090	Magic Siege Engine, Greater	/spells/Magic Siege Engine, Greater
2091	Abundant Ammunition	/spells/Abundant Ammunition
2092	Adjuring Step	/spells/Adjuring Step
2093	Adoration	/spells/Adoration
2094	Air Bubble	/spells/Air Bubble
2095	Air Walk, Communal	/spells/Air Walk, Communal
2096	Animal Aspect	/spells/Animal Aspect
2097	Animal Aspect, Greater	/spells/Animal Aspect, Greater
2098	Ant Haul, Communal	/spells/Ant Haul, Communal
2099	Mask Dweomer, Communal	/spells/Mask Dweomer, Communal
2100	Arcane Cannon	/spells/Arcane Cannon
2101	Bestow Weapon Proficiency	/spells/Bestow Weapon Proficiency
2102	Blistering Invective	/spells/Blistering Invective
2103	Bowstaff	/spells/Bowstaff
2104	Brow Gasher	/spells/Brow Gasher
2105	Bullet Shield	/spells/Bullet Shield
2106	Burst of Speed	/spells/Burst of Speed
2107	Deadly Juggernaut	/spells/Deadly Juggernaut
2108	Caging Bomb Admixture	/spells/Caging Bomb Admixture
2109	Certain Grip	/spells/Certain Grip
2110	Chain of Perdition	/spells/Chain of Perdition
2111	Companion Mind Link	/spells/Companion Mind Link
2112	Compel Hostility	/spells/Compel Hostility
2113	Damp Powder	/spells/Damp Powder
2114	Darkvision, Communal	/spells/Darkvision, Communal
2115	Daybreak Arrow	/spells/Daybreak Arrow
2116	Debilitating Portent	/spells/Debilitating Portent
2117	Delay Poison, Communal	/spells/Delay Poison, Communal
2118	Destabilize Powder	/spells/Destabilize Powder
2119	Discovery Torch	/spells/Discovery Torch
2120	Divine Arrow	/spells/Divine Arrow
2121	Dust Form	/spells/Dust Form
2122	Effortless Armor	/spells/Effortless Armor
2123	Endure Elements, Communal	/spells/Endure Elements, Communal
2124	Energy Siege Shot	/spells/Energy Siege Shot
2125	Energy Siege Shot, Greater	/spells/Energy Siege Shot, Greater
2126	Fabricate Bullets	/spells/Fabricate Bullets
2127	Fiery Shuriken	/spells/Fiery Shuriken
2128	Find Quarry	/spells/Find Quarry
2129	Flash Fire	/spells/Flash Fire
2130	Forest Friend	/spells/Forest Friend
2131	Frightful Aspect	/spells/Frightful Aspect
2132	Frost Fall	/spells/Frost Fall
2133	Haunted Fey Aspect	/spells/Haunted Fey Aspect
2134	Healing Thief	/spells/Healing Thief
2135	Mind Blank, Communal	/spells/Mind Blank, Communal
2136	Heroic Invocation	/spells/Heroic Invocation
2137	Hostile Juxtaposition	/spells/Hostile Juxtaposition
2138	Hostile Juxtaposition, Greater	/spells/Hostile Juxtaposition, Greater
2139	Hostile Levitation	/spells/Hostile Levitation
2140	Illusion of Calm	/spells/Illusion of Calm
2141	Instrument of Agony	/spells/Instrument of Agony
2142	Jolting Portent	/spells/Jolting Portent
2143	Judgment Light	/spells/Judgment Light
2144	Jury-Rig	/spells/Jury-Rig
2145	Kinetic Reverberation	/spells/Kinetic Reverberation
2146	Languid Bomb Admixture	/spells/Languid Bomb Admixture
2147	Liberating Command	/spells/Liberating Command
2148	Life Conduit	/spells/Life Conduit
2149	Life Conduit, Greater	/spells/Life Conduit, Greater
2150	Life Conduit, Improved	/spells/Life Conduit, Improved
2151	Lightning Lash Bomb Admixture	/spells/Lightning Lash Bomb Admixture
2152	Litany of Defense	/spells/Litany of Defense
2153	Litany Of Eloquence	/spells/Litany Of Eloquence
2154	Litany of Entanglement	/spells/Litany of Entanglement
2155	Litany Of Madness	/spells/Litany Of Madness
2156	Litany Of Righteousness	/spells/Litany Of Righteousness
2157	Litany of Sight	/spells/Litany of Sight
2158	Litany of Sloth	/spells/Litany of Sloth
2159	Litany of Thunder	/spells/Litany of Thunder
2160	Litany Of Vengeance	/spells/Litany Of Vengeance
2161	Litany of Warding	/spells/Litany of Warding
2162	Litany of Weakness	/spells/Litany of Weakness
2163	Locate Weakness	/spells/Locate Weakness
2164	Lock Gaze	/spells/Lock Gaze
2165	Longshot	/spells/Longshot
2166	Magic Siege Engine	/spells/Magic Siege Engine
2489	Film Of Filth	/spells/Film Of Filth
2167	Protection from Chaos, Communal	/spells/Protection from Chaos, Communal
2168	Mirror Strike	/spells/Mirror Strike
2169	Moment of Greatness	/spells/Moment of Greatness
2170	Mount, Communal	/spells/Mount, Communal
2171	Mutagenic Touch	/spells/Mutagenic Touch
2172	Named Bullet	/spells/Named Bullet
2173	Named Bullet, Greater	/spells/Named Bullet, Greater
2174	Negative Reaction	/spells/Negative Reaction
2175	Nondetection, Communal	/spells/Nondetection, Communal
2176	Protection from Energy, Communal	/spells/Protection from Energy, Communal
2177	Protection from Evil, Communal	/spells/Protection from Evil, Communal
2178	Obsidian Flow	/spells/Obsidian Flow
2179	Peacebond	/spells/Peacebond
2180	Pellet Blast	/spells/Pellet Blast
2181	Phantom Chariot	/spells/Phantom Chariot
2182	Phantom Driver	/spells/Phantom Driver
2183	Phantom Steed, Communal	/spells/Phantom Steed, Communal
2184	Pilfering Hand	/spells/Pilfering Hand
2185	Protection from Arrows, Communal	/spells/Protection from Arrows, Communal
2186	Mind Thrust V	/spells/Mind Thrust V
2187	Pup Shape	/spells/Pup Shape
2188	Qualm	/spells/Qualm
2189	Recoil Fire	/spells/Recoil Fire
2190	Reinforce Armaments	/spells/Reinforce Armaments
2191	Reinforce Armaments, Communal	/spells/Reinforce Armaments, Communal
2192	Reloading Hands	/spells/Reloading Hands
2193	Resinous Skin	/spells/Resinous Skin
2194	Resist Energy, Communal	/spells/Resist Energy, Communal
2195	Returning Weapon	/spells/Returning Weapon
2196	Returning Weapon, Communal	/spells/Returning Weapon, Communal
2197	Ricochet Shot	/spells/Ricochet Shot
2198	See Alignment	/spells/See Alignment
2199	Shadow Bomb Admixture	/spells/Shadow Bomb Admixture
2200	Share Language, Communal	/spells/Share Language, Communal
2201	Shock Shield	/spells/Shock Shield
2202	Shocking Image	/spells/Shocking Image
2203	Siege Of Trees	/spells/Siege Of Trees
2204	Siege of Trees, Greater	/spells/Siege of Trees, Greater
2205	Spell Immunity, Communal	/spells/Spell Immunity, Communal
2206	Spontaneous Immolation	/spells/Spontaneous Immolation
2207	Stabilize Powder	/spells/Stabilize Powder
2208	Stoneskin, Communal	/spells/Stoneskin, Communal
2209	Summoner Conduit	/spells/Summoner Conduit
2210	Sun Metal	/spells/Sun Metal
2211	Symbol Of Striking	/spells/Symbol Of Striking
2212	Tactical Acumen	/spells/Tactical Acumen
2213	Unerring Weapon	/spells/Unerring Weapon
2214	Mind Thrust VI	/spells/Mind Thrust VI
2215	Tar Pool	/spells/Tar Pool
2216	Targeted Bomb Admixture	/spells/Targeted Bomb Admixture
2217	Telekinetic Assembly	/spells/Telekinetic Assembly
2218	Telekinetic Charge	/spells/Telekinetic Charge
2219	Terrain Bond	/spells/Terrain Bond
2220	Thunder Fire	/spells/Thunder Fire
2221	Tongues, Communal	/spells/Tongues, Communal
2222	Touch Injection	/spells/Touch Injection
2223	Twisted Space	/spells/Twisted Space
2224	Viper Bomb Admixture	/spells/Viper Bomb Admixture
2225	Walk Through Space	/spells/Walk Through Space
2226	Warding Weapon	/spells/Warding Weapon
2227	Water Walk, Communal	/spells/Water Walk, Communal
2228	Weaken Powder	/spells/Weaken Powder
2229	Wilderness Soldiers	/spells/Wilderness Soldiers
2230	Lash of the Astradaemon	/spells/Lash of the Astradaemon
2231	Parasitic Soul	/spells/Parasitic Soul
2232	Wreath of Blades	/spells/Wreath of Blades
2233	Aspect of the Nightingale	/spells/Aspect of the Nightingale
2234	Vampiric Hunger	/spells/Vampiric Hunger
2235	Awaken the Devoured	/spells/Awaken the Devoured
2236	Charon's Dispensation	/spells/Charon's Dispensation
2237	Create Soul Gem	/spells/Create Soul Gem
2238	Daemon Ward	/spells/Daemon Ward
2239	Death Knell Aura	/spells/Death Knell Aura
2240	Death Knell Aura, Greater	/spells/Death Knell Aura, Greater
2241	Scourge of the Horsemen	/spells/Scourge of the Horsemen
2242	Soul Transfer	/spells/Soul Transfer
2243	Summon Cacodaemon	/spells/Summon Cacodaemon
2244	Summon Cacodaemon, Greater	/spells/Summon Cacodaemon, Greater
2245	Summon Ceustodaemon	/spells/Summon Ceustodaemon
2246	Summon Derghodaemon	/spells/Summon Derghodaemon
2247	Summon Erodaemon	/spells/Summon Erodaemon
2248	Summon Meladaemon	/spells/Summon Meladaemon
2249	Summon Thanadaemon	/spells/Summon Thanadaemon
2250	Call the Void	/spells/Call the Void
2251	Black Spot	/spells/Black Spot
2252	Salvage	/spells/Salvage
2253	Malediction	/spells/Malediction
2254	Skeleton Crew	/spells/Skeleton Crew
2255	Track Ship	/spells/Track Ship
2256	Unseen Crew	/spells/Unseen Crew
2257	Advanced Scurvy	/spells/Advanced Scurvy
2258	Cloud Of Seasickness	/spells/Cloud Of Seasickness
2259	Submerge Ship	/spells/Submerge Ship
2260	Heroic Fortune	/spells/Heroic Fortune
2261	Heroic Fortune, Mass	/spells/Heroic Fortune, Mass
2262	Severed Fate	/spells/Severed Fate
2263	Unravel Destiny	/spells/Unravel Destiny
2264	Embrace Destiny	/spells/Embrace Destiny
2265	Groundswell	/spells/Groundswell
2266	Ironbeard	/spells/Ironbeard
2267	Toilsome Chant	/spells/Toilsome Chant
2268	Blend	/spells/Blend
2269	Ward Of The Season	/spells/Ward Of The Season
2270	Whispering Lore	/spells/Whispering Lore
2271	Death From Below	/spells/Death From Below
2272	Jitterbugs	/spells/Jitterbugs
2273	Major Phantom Object	/spells/Major Phantom Object
2274	Minor Dream	/spells/Minor Dream
2275	Minor Phantom Object	/spells/Minor Phantom Object
2276	Recharge Innate Magic	/spells/Recharge Innate Magic
2277	Forgetful Slumber	/spells/Forgetful Slumber
2278	Paragon Surge	/spells/Paragon Surge
2279	Resilient Reservoir	/spells/Resilient Reservoir
2280	Urban Grace	/spells/Urban Grace
2281	Winter's Grasp	/spells/Winter's Grasp
2282	Battle Trance	/spells/Battle Trance
2283	Ghost Wolf	/spells/Ghost Wolf
2284	Half-Blood Extraction	/spells/Half-Blood Extraction
2285	Linebreaker	/spells/Linebreaker
2286	Savage Maw	/spells/Savage Maw
2287	Blessing Of Luck And Resolve	/spells/Blessing Of Luck And Resolve
2288	Blessing Of Luck And Resolve, Mass	/spells/Blessing Of Luck And Resolve, Mass
2289	Escaping Ward	/spells/Escaping Ward
2290	Fearsome Duplicate	/spells/Fearsome Duplicate
2291	Share Shape	/spells/Share Shape
2292	Village Veil	/spells/Village Veil
2293	Bestow Insight	/spells/Bestow Insight
2294	Black Mark	/spells/Black Mark
2295	Old Salt's Curse	/spells/Old Salt's Curse
2296	Sacred Space	/spells/Sacred Space
2297	Truespeak	/spells/Truespeak
2298	Veil Of Heaven	/spells/Veil Of Heaven
2299	Web Cloud	/spells/Web Cloud
2300	Sky Steed	/spells/Sky Steed
2301	Nine Lives	/spells/Nine Lives
2302	Steal Breath	/spells/Steal Breath
2303	Blinding Ray	/spells/Blinding Ray
2304	Life Channel	/spells/Life Channel
2305	Spawn Ward	/spells/Spawn Ward
2306	Ancestral Regression	/spells/Ancestral Regression
2307	Web Bolt	/spells/Web Bolt
2308	Death Candle	/spells/Death Candle
2309	Gloomblind Bolts	/spells/Gloomblind Bolts
2310	Shadowy Haven	/spells/Shadowy Haven
2311	Fire Trail	/spells/Fire Trail
2312	Mudball	/spells/Mudball
2313	Vomit Twin	/spells/Vomit Twin
2314	Agonizing Rebuke	/spells/Agonizing Rebuke
2315	Chains Of Fire	/spells/Chains Of Fire
2316	Flurry Of Snowballs	/spells/Flurry Of Snowballs
2317	Firestream	/spells/Firestream
2318	Fury Of The Sun	/spells/Fury Of The Sun
2319	Healing Warmth	/spells/Healing Warmth
2320	Scorching Ash Form	/spells/Scorching Ash Form
2321	Touch Of Combustion	/spells/Touch Of Combustion
2322	Improve Trap	/spells/Improve Trap
2323	Blood Blaze	/spells/Blood Blaze
2324	Blood Scent	/spells/Blood Scent
2325	Delay Disease	/spells/Delay Disease
2326	Enemy's Heart	/spells/Enemy's Heart
2327	Sentry Skull	/spells/Sentry Skull
2328	Binding Earth	/spells/Binding Earth
2329	Binding Earth, Mass	/spells/Binding Earth, Mass
2330	Mighty Fist Of The Earth	/spells/Mighty Fist Of The Earth
2331	Raging Rubble	/spells/Raging Rubble
2332	Stone Shield	/spells/Stone Shield
2333	Alchemical Tinkering	/spells/Alchemical Tinkering
2334	Sickening Strikes	/spells/Sickening Strikes
2335	Absorbing Inhalation	/spells/Absorbing Inhalation
2336	Cloud Shape	/spells/Cloud Shape
2337	Gusting Sphere	/spells/Gusting Sphere
2338	Miasmatic Form	/spells/Miasmatic Form
2339	Path Of The Winds	/spells/Path Of The Winds
2340	Wind Blades	/spells/Wind Blades
2341	Windy Escape	/spells/Windy Escape
2342	Commune With Birds	/spells/Commune With Birds
2343	Theft Ward	/spells/Theft Ward
2344	Winter Feathers	/spells/Winter Feathers
2345	Damnation Stride	/spells/Damnation Stride
2346	Hellmouth Lash	/spells/Hellmouth Lash
2347	Marid's Mastery	/spells/Marid's Mastery
2348	Nereid's Grace	/spells/Nereid's Grace
2349	Nixie's Lure	/spells/Nixie's Lure
2350	Undine's Curse	/spells/Undine's Curse
2351	Sow Thought	/spells/Sow Thought
2352	Aboleth's Lung	/spells/Aboleth's Lung
2353	Fins To Feet	/spells/Fins To Feet
2354	Karmic Blessing	/spells/Karmic Blessing
2355	Strong Wings	/spells/Strong Wings
2356	Imbue With Elemental Might	/spells/Imbue With Elemental Might
2357	Earth Glide	/spells/Earth Glide
2358	Prehensile Pilfer	/spells/Prehensile Pilfer
2359	Squeeze	/spells/Squeeze
2360	Shadow Anchor	/spells/Shadow Anchor
2361	Blood Money	/spells/Blood Money
2362	Covetous Aura	/spells/Covetous Aura
2363	Deathwine	/spells/Deathwine
2364	Sign Of Wrath	/spells/Sign Of Wrath
2365	Swipe	/spells/Swipe
2366	Unconscious Agenda	/spells/Unconscious Agenda
2367	Ironbloom Sprouts	/spells/Ironbloom Sprouts
2368	Bed Of Iron	/spells/Bed Of Iron
2369	Phantom Blood	/spells/Phantom Blood
2370	Carry Companion	/spells/Carry Companion
2371	Clarion Call	/spells/Clarion Call
2372	Emblazon Crest	/spells/Emblazon Crest
2373	Keep Watch	/spells/Keep Watch
2374	Serren's Armor Lock	/spells/Serren's Armor Lock
2375	Serren's Swift Girding	/spells/Serren's Swift Girding
2376	Ward Shield	/spells/Ward Shield
2377	Curse Item	/spells/Curse Item
2378	Snowball	/spells/Snowball
2379	Lissalan Snake Sigil	/spells/Lissalan Snake Sigil
2380	Display Aversion	/spells/Display Aversion
2381	Domination Link	/spells/Domination Link
2382	Project Weakness	/spells/Project Weakness
2383	Steal Years	/spells/Steal Years
2384	Steal Years, Greater	/spells/Steal Years, Greater
2385	Transmute Wine To Blood	/spells/Transmute Wine To Blood
2386	Frost Mammoth	/spells/Frost Mammoth
2387	Chameleon Scales	/spells/Chameleon Scales
2388	Irriseni Mirror Sight	/spells/Irriseni Mirror Sight
2389	Bleed For Your Master	/spells/Bleed For Your Master
2390	Die For Your Master	/spells/Die For Your Master
2391	Familiar Figment	/spells/Familiar Figment
2392	Hunter's Friend	/spells/Hunter's Friend
2393	Scamper	/spells/Scamper
2394	Sea Steed	/spells/Sea Steed
2395	Sea Stallion	/spells/Sea Stallion
2396	Ice Spears	/spells/Ice Spears
2397	Martyr's Last Blessing	/spells/Martyr's Last Blessing
2398	Peasant Armaments	/spells/Peasant Armaments
2399	Conjure Deadfall	/spells/Conjure Deadfall
2400	Create Holds	/spells/Create Holds
2401	Determine Depth	/spells/Determine Depth
2402	Discern Value	/spells/Discern Value
2403	Nature's Ravages	/spells/Nature's Ravages
2404	Nature's Ravages, Greater	/spells/Nature's Ravages, Greater
2405	Corpse Hammer	/spells/Corpse Hammer
2406	Oath Of Justice	/spells/Oath Of Justice
2407	Tactical Formation	/spells/Tactical Formation
2408	Soothing Word	/spells/Soothing Word
2409	Frosthammer	/spells/Frosthammer
2410	Accept Affliction	/spells/Accept Affliction
2411	Angelic Aspect, Lesser	/spells/Angelic Aspect, Lesser
2412	Angelic Aspect, Greater	/spells/Angelic Aspect, Greater
2413	Angelic Aspect	/spells/Angelic Aspect
2414	Archon's Trumpet	/spells/Archon's Trumpet
2415	Burst Of Radiance	/spells/Burst Of Radiance
2416	Chains Of Light	/spells/Chains Of Light
2417	Touch Of Mercy	/spells/Touch Of Mercy
2418	Hymn Of Mercy	/spells/Hymn Of Mercy
2419	Hymn Of Peace	/spells/Hymn Of Peace
2420	Blood Of The Martyr	/spells/Blood Of The Martyr
2421	Dark-Light	/spells/Dark-Light
2422	Enlarge Tail	/spells/Enlarge Tail
2423	Lead Plating	/spells/Lead Plating
2424	Pierce Disguise	/spells/Pierce Disguise
2425	Charitable Impulse	/spells/Charitable Impulse
2426	Elemental Assessor	/spells/Elemental Assessor
2427	Sanctify Weapons	/spells/Sanctify Weapons
2428	Summon Stampede	/spells/Summon Stampede
2429	Vinetrap	/spells/Vinetrap
2430	Black Sword Of War	/spells/Black Sword Of War
2431	Bloody Tears And Jagged Smile	/spells/Bloody Tears And Jagged Smile
2432	Blightburn Weapon	/spells/Blightburn Weapon
2433	Shadow Dragon Aspect	/spells/Shadow Dragon Aspect
2434	Strip Scales	/spells/Strip Scales
2435	Unseen Engineers	/spells/Unseen Engineers
2436	Detect Relations	/spells/Detect Relations
2437	Business Booms	/spells/Business Booms
2438	Prosperous Room	/spells/Prosperous Room
2439	Renovation	/spells/Renovation
2440	Spellcrash	/spells/Spellcrash
2441	Teleport Structure	/spells/Teleport Structure
2442	Bless Army	/spells/Bless Army
2443	Imbue Army Special Ability	/spells/Imbue Army Special Ability
2444	Tactical Insight	/spells/Tactical Insight
2445	Ceremony	/spells/Ceremony
2446	Dragon Turtle Shell	/spells/Dragon Turtle Shell
2447	Draconic Suppression	/spells/Draconic Suppression
2448	Dragonvoice	/spells/Dragonvoice
2449	Dungeonsight	/spells/Dungeonsight
2450	Erode Defenses	/spells/Erode Defenses
2451	Gravity Well	/spells/Gravity Well
2452	Heart Of The Mammoth	/spells/Heart Of The Mammoth
2453	Illusory Hoard	/spells/Illusory Hoard
2454	Kreighton's Perusal	/spells/Kreighton's Perusal
2455	Page-Bound Epiphany	/spells/Page-Bound Epiphany
2456	Collaborative Thaumaturgy	/spells/Collaborative Thaumaturgy
2457	Sure Casting	/spells/Sure Casting
2458	Cauterizing Weapon	/spells/Cauterizing Weapon
2459	Tactical Miscalculation	/spells/Tactical Miscalculation
2460	Wall Of Light	/spells/Wall Of Light
2461	Path Of Glory	/spells/Path Of Glory
2462	Blood Song	/spells/Blood Song
2463	Hallucinogenic Smoke	/spells/Hallucinogenic Smoke
2464	Jungle Mind	/spells/Jungle Mind
2465	Lay Of The Land	/spells/Lay Of The Land
2466	Source Severance	/spells/Source Severance
2467	Tectonic Communion	/spells/Tectonic Communion
2468	Anti-Summoning Shield	/spells/Anti-Summoning Shield
2469	Unleash Pandemonium	/spells/Unleash Pandemonium
2470	Path Of Glory, Greater	/spells/Path Of Glory, Greater
2471	Burst With Light	/spells/Burst With Light
2472	Detect Demon	/spells/Detect Demon
2473	Protection From Outsiders	/spells/Protection From Outsiders
2474	Righteous Blood	/spells/Righteous Blood
2475	Telepathic Censure	/spells/Telepathic Censure
2476	Vermicious Assumption	/spells/Vermicious Assumption
2477	Contact Nalfeshnee	/spells/Contact Nalfeshnee
2478	Ascension	/spells/Ascension
2479	Bleed Glory	/spells/Bleed Glory
2480	Deathless	/spells/Deathless
2481	Lend Path	/spells/Lend Path
2482	Mythic Severance	/spells/Mythic Severance
2483	Restore Mythic Power	/spells/Restore Mythic Power
2484	Share Glory	/spells/Share Glory
2485	Steal Power	/spells/Steal Power
2486	Accursed Glare	/spells/Accursed Glare
2487	Terraform	/spells/Terraform
2488	Apparent Treachery	/spells/Apparent Treachery
2490	Lightning Lash	/spells/Lightning Lash
2491	Maw Of Chaos	/spells/Maw Of Chaos
2492	Summon Greater Demon	/spells/Summon Greater Demon
2493	Summon Lesser Demon	/spells/Summon Lesser Demon
2494	Share Skin	/spells/Share Skin
2495	Borrowed Time	/spells/Borrowed Time
2496	Elemental Bombardment	/spells/Elemental Bombardment
2497	Imbue With Flight	/spells/Imbue With Flight
2498	Soulreaver	/spells/Soulreaver
2499	Sustaining Legend	/spells/Sustaining Legend
2500	Share Skin, Greater	/spells/Share Skin, Greater
2501	Heavy Water	/spells/Heavy Water
2502	Hydrophobia	/spells/Hydrophobia
2503	Blood Boil	/spells/Blood Boil
2504	Rune Of Jandelay	/spells/Rune Of Jandelay
2505	Bleeding Strike	/spells/Bleeding Strike
2506	Reveal Mirage	/spells/Reveal Mirage
2507	Storm Of Blades	/spells/Storm Of Blades
2508	Summon Genie, Lesser	/spells/Summon Genie, Lesser
2509	Summon Genie	/spells/Summon Genie
2510	Summon Genie, Greater	/spells/Summon Genie, Greater
2511	Abyssal Vermin	/spells/Abyssal Vermin
2512	Explosion Of Rot	/spells/Explosion Of Rot
2513	Antithetical Constraint	/spells/Antithetical Constraint
2514	Arbitrament	/spells/Arbitrament
2515	Ardor's Onslaught	/spells/Ardor's Onslaught
2516	Counterbalancing Aura	/spells/Counterbalancing Aura
2517	Night Of Blades	/spells/Night Of Blades
2518	Dispel Balance	/spells/Dispel Balance
2519	Recentering Drone	/spells/Recentering Drone
2520	Steal Book	/spells/Steal Book
2521	Summon Lesser Psychopomp	/spells/Summon Lesser Psychopomp
2522	Summon Vanth	/spells/Summon Vanth
2523	Possession Trap	/spells/Possession Trap
2524	Sphere Of Warding	/spells/Sphere Of Warding
2525	Wave Shield	/spells/Wave Shield
2526	Carrion Compass	/spells/Carrion Compass
2527	Empower Holy Water	/spells/Empower Holy Water
2528	Force Anchor	/spells/Force Anchor
2529	Life Shield	/spells/Life Shield
2530	Necromantic Burden	/spells/Necromantic Burden
2531	Undeath Inversion	/spells/Undeath Inversion
2532	Abadar's Truthtelling	/spells/Abadar's Truthtelling
2533	Abstemiousness	/spells/Abstemiousness
2534	Baphomet's Blessing	/spells/Baphomet's Blessing
2535	Beacon Of Luck	/spells/Beacon Of Luck
2536	Blade Snare	/spells/Blade Snare
2537	Blessing Of The Watch	/spells/Blessing Of The Watch
2538	Brittle Portal	/spells/Brittle Portal
2539	Burst Of Glory	/spells/Burst Of Glory
2540	Caustic Blood	/spells/Caustic Blood
2541	Channel The Gift	/spells/Channel The Gift
2542	Tracking Mark	/spells/Tracking Mark
2543	Channel Vigor	/spells/Channel Vigor
2544	Dead Eye's Arrow	/spells/Dead Eye's Arrow
2545	Defending Bone	/spells/Defending Bone
2546	Dream Feast	/spells/Dream Feast
2547	Early Judgment	/spells/Early Judgment
2548	Enhance Water	/spells/Enhance Water
2549	Face Of The Devourer	/spells/Face Of The Devourer
2550	Fairness	/spells/Fairness
2551	Fallback Strategy	/spells/Fallback Strategy
2552	False Alibi	/spells/False Alibi
2553	Firebelly	/spells/Firebelly
2554	Fractions Of Heal And Harm	/spells/Fractions Of Heal And Harm
2555	Freedom's Toast	/spells/Freedom's Toast
2556	Ghoul Hunger	/spells/Ghoul Hunger
2557	Gozreh's Trident	/spells/Gozreh's Trident
2558	Hairline Fractures	/spells/Hairline Fractures
2559	Hammer Of Mending	/spells/Hammer Of Mending
2560	Haze Of Dreams	/spells/Haze Of Dreams
2561	Hunter's Blessing	/spells/Hunter's Blessing
2562	Ice Armor	/spells/Ice Armor
2563	Inheritor's Smite	/spells/Inheritor's Smite
2564	Light Prison	/spells/Light Prison
2565	Lighten Object	/spells/Lighten Object
2566	Lighten Object, Mass	/spells/Lighten Object, Mass
2567	Lose The Trail	/spells/Lose The Trail
2568	Maddening Oubliette	/spells/Maddening Oubliette
2569	Monstrous Extremities	/spells/Monstrous Extremities
2570	Pick Your Poison	/spells/Pick Your Poison
2571	Plague Bearer	/spells/Plague Bearer
2572	Poisoned Egg	/spells/Poisoned Egg
2573	Read Weather	/spells/Read Weather
2574	Replenish Ki	/spells/Replenish Ki
2575	Rovagug's Fury	/spells/Rovagug's Fury
2576	Sadomasochism	/spells/Sadomasochism
2577	Secret Speech	/spells/Secret Speech
2578	Seducer's Eyes	/spells/Seducer's Eyes
2579	Shared Sacrifice	/spells/Shared Sacrifice
2580	Shield Of The Dawnflower, Greater	/spells/Shield Of The Dawnflower, Greater
2581	Sky Swim	/spells/Sky Swim
2582	Smite Abomination	/spells/Smite Abomination
2583	Spawn Calling	/spells/Spawn Calling
2584	Spell Gauge	/spells/Spell Gauge
2585	Spell Scourge	/spells/Spell Scourge
2586	Symbol Of Debauchery	/spells/Symbol Of Debauchery
2587	Symbol Of Dispelling	/spells/Symbol Of Dispelling
2588	Tap Inner Beauty	/spells/Tap Inner Beauty
2589	Touch Of Bloodletting	/spells/Touch Of Bloodletting
2590	Transplant Visage	/spells/Transplant Visage
2591	Unwelcome Halo	/spells/Unwelcome Halo
2592	Vengeful Stinger	/spells/Vengeful Stinger
2593	Vexing Miscalculation	/spells/Vexing Miscalculation
2594	Weapons Against Evil	/spells/Weapons Against Evil
2595	Create Variant Mummy	/spells/Create Variant Mummy
2596	Virulence	/spells/Virulence
2597	Calculated Luck	/spells/Calculated Luck
2598	Cleromancy	/spells/Cleromancy
2599	Luck Y Number	/spells/Luck Y Number
2600	Mathematical Curse	/spells/Mathematical Curse
2601	Numerological Evocation	/spells/Numerological Evocation
2602	Numerological Resistance	/spells/Numerological Resistance
2603	Spectral Saluqi	/spells/Spectral Saluqi
2604	Harrowing, Greater	/spells/Harrowing, Greater
2605	Abeyance	/spells/Abeyance
2606	Aggravate Affliction	/spells/Aggravate Affliction
2607	Bestow Curse, Greater	/spells/Bestow Curse, Greater
2608	Storm Step	/spells/Storm Step
2609	Boneshatter	/spells/Boneshatter
2610	Alter River	/spells/Alter River
2611	Detect Metal	/spells/Detect Metal
2612	Hanspur's Flotsam Vessel	/spells/Hanspur's Flotsam Vessel
2613	Discharge	/spells/Discharge
2614	Magnetic Field	/spells/Magnetic Field
2615	Resounding Clang	/spells/Resounding Clang
2616	Riversight	/spells/Riversight
2617	Sabotage Construct	/spells/Sabotage Construct
2618	Antitech Field	/spells/Antitech Field
2619	Destroy Robot	/spells/Destroy Robot
2620	Detect Radiation	/spells/Detect Radiation
2621	Planetary Adaptation, Mass	/spells/Planetary Adaptation, Mass
2622	Discharge, Greater	/spells/Discharge, Greater
2623	Infuse Robot	/spells/Infuse Robot
2624	Irradiate	/spells/Irradiate
2625	Magic Circle Against Technology	/spells/Magic Circle Against Technology
2626	Make Whole, Greater	/spells/Make Whole, Greater
2627	Memory Of Function	/spells/Memory Of Function
2628	Protection From Technology	/spells/Protection From Technology
2629	Align Weapon, Communal	/spells/Align Weapon, Communal
2630	Rebuke Technology	/spells/Rebuke Technology
2631	Recharge	/spells/Recharge
2632	Remove Radioactivity	/spells/Remove Radioactivity
2633	Remove Radioactivity, Greater	/spells/Remove Radioactivity, Greater
2634	Technomancy	/spells/Technomancy
2635	Cosmic Ray	/spells/Cosmic Ray
2636	Gravity Sphere	/spells/Gravity Sphere
2637	Planetarium	/spells/Planetarium
2638	Planetary Adaptation	/spells/Planetary Adaptation
2639	Reboot	/spells/Reboot
2640	Starsight	/spells/Starsight
2641	Adhesive Blood	/spells/Adhesive Blood
2642	Adhesive Spittle	/spells/Adhesive Spittle
2643	Adjustable Disguise	/spells/Adjustable Disguise
2644	Adjustable Polymorph	/spells/Adjustable Polymorph
2645	Aggressive Thundercloud	/spells/Aggressive Thundercloud
2646	Aggressive Thundercloud, Greater	/spells/Aggressive Thundercloud, Greater
2647	Air Geyser	/spells/Air Geyser
2648	Air Step	/spells/Air Step
2649	Alter Musical Instrument	/spells/Alter Musical Instrument
2650	Anchored Step	/spells/Anchored Step
2651	Animal Purpose Training	/spells/Animal Purpose Training
2652	Anonymous Interaction	/spells/Anonymous Interaction
2653	Anti-Incorporeal Shell	/spells/Anti-Incorporeal Shell
2654	Aura Sight	/spells/Aura Sight
2655	Banshee Blast	/spells/Banshee Blast
2656	Barrow Haze	/spells/Barrow Haze
2657	Beastspeak	/spells/Beastspeak
2658	Bestow Auras	/spells/Bestow Auras
2659	Blazing Rainbow	/spells/Blazing Rainbow
2660	Blessed Fist	/spells/Blessed Fist
2661	Bloatbomb	/spells/Bloatbomb
2662	Blood Armor	/spells/Blood Armor
2663	Blood Sentinel	/spells/Blood Sentinel
2664	Blurred Movement	/spells/Blurred Movement
2665	Body Capacitance	/spells/Body Capacitance
2666	Bullet Ward	/spells/Bullet Ward
2667	Buoyancy	/spells/Buoyancy
2668	Blood Salvation	/spells/Blood Salvation
2669	Chameleon Stride, Greater	/spells/Chameleon Stride, Greater
2670	Climbing Beanstalk	/spells/Climbing Beanstalk
2671	Companion Life Link	/spells/Companion Life Link
2672	Contingent Action	/spells/Contingent Action
2673	Contingent Scroll	/spells/Contingent Scroll
2674	Creeping Ice	/spells/Creeping Ice
2675	Crimson Confession	/spells/Crimson Confession
2676	Curse Of Burning Sleep	/spells/Curse Of Burning Sleep
2677	Dimensional Bounce	/spells/Dimensional Bounce
2678	Disable Construct	/spells/Disable Construct
2679	Discern Next Of Kin	/spells/Discern Next Of Kin
2680	Disguise Weapon	/spells/Disguise Weapon
2681	Enchantment Foil	/spells/Enchantment Foil
2682	Enemy Insight	/spells/Enemy Insight
2683	Euphoric Cloud	/spells/Euphoric Cloud
2684	Extreme Flexibility	/spells/Extreme Flexibility
2685	Eyes Of The Void	/spells/Eyes Of The Void
2686	Fairy Ring Retreat	/spells/Fairy Ring Retreat
2687	Familiar Double	/spells/Familiar Double
2688	Feast On Fear	/spells/Feast On Fear
2689	Flaming Sphere, Greater	/spells/Flaming Sphere, Greater
2690	Flexible Fury	/spells/Flexible Fury
2691	Focused Scrutiny	/spells/Focused Scrutiny
2692	Font Of Spirit Magic	/spells/Font Of Spirit Magic
2693	Gentle Breeze	/spells/Gentle Breeze
2694	Glue Seal	/spells/Glue Seal
2695	Guardian Of Faith	/spells/Guardian Of Faith
2696	Heart Of The Metal	/spells/Heart Of The Metal
2697	Heightened Awareness	/spells/Heightened Awareness
2698	Heightened Reflexes	/spells/Heightened Reflexes
2699	Hex Glyph	/spells/Hex Glyph
2700	Hex Glyph, Greater	/spells/Hex Glyph, Greater
2701	Hex Vulnerability	/spells/Hex Vulnerability
2702	Holy Ice Weapon	/spells/Holy Ice Weapon
2703	Investigative Mind	/spells/Investigative Mind
2704	Invisibility Alarm	/spells/Invisibility Alarm
2705	Life Pact	/spells/Life Pact
2706	Line In The Sand	/spells/Line In The Sand
2707	Long Arm	/spells/Long Arm
2708	Longstrider, Greater	/spells/Longstrider, Greater
2709	Magnifying Chime	/spells/Magnifying Chime
2710	Mantle Of Calm	/spells/Mantle Of Calm
2711	Marching Chant	/spells/Marching Chant
2712	Mark Of Obvious Ethics	/spells/Mark Of Obvious Ethics
2713	Memorize Page	/spells/Memorize Page
2714	Persistent Vigor	/spells/Persistent Vigor
2715	Mindlocked Messenger	/spells/Mindlocked Messenger
2716	Mirror Hideaway	/spells/Mirror Hideaway
2717	Mirror Polish	/spells/Mirror Polish
2718	Mirror Transport	/spells/Mirror Transport
2719	Molten Orb	/spells/Molten Orb
2720	Monkey Fish	/spells/Monkey Fish
2721	Muffle Sound	/spells/Muffle Sound
2722	Nauseating Dart	/spells/Nauseating Dart
2723	Nauseating Trail	/spells/Nauseating Trail
2724	Thought Shield III	/spells/Thought Shield III
2725	Planeslayer's Call	/spells/Planeslayer's Call
2726	Polymorph Familiar	/spells/Polymorph Familiar
2727	Refine Improvised Weapon	/spells/Refine Improvised Weapon
2728	Repair Undead	/spells/Repair Undead
2729	Repair Undead, Mass	/spells/Repair Undead, Mass
2730	River Whip	/spells/River Whip
2731	Sense Spirit Magic	/spells/Sense Spirit Magic
2732	Shield Companion	/spells/Shield Companion
2733	Shield Of Fortification	/spells/Shield Of Fortification
2734	Shield Of Fortification, Greater	/spells/Shield Of Fortification, Greater
2735	Sickening Entanglement	/spells/Sickening Entanglement
2736	Silent Table	/spells/Silent Table
2737	Silver Darts	/spells/Silver Darts
2738	Slowing Mud	/spells/Slowing Mud
2739	Sonic Form	/spells/Sonic Form
2740	Sonic Scream	/spells/Sonic Scream
2741	Speak With Haunt	/spells/Speak With Haunt
2742	Spellcrash, Lesser	/spells/Spellcrash, Lesser
2743	Spellcrash, Greater	/spells/Spellcrash, Greater
2744	Stench Of Prey	/spells/Stench Of Prey
2745	Stone Discus	/spells/Stone Discus
2746	Stricken Heart	/spells/Stricken Heart
2747	Stunning Barrier	/spells/Stunning Barrier
2748	Stunning Barrier, Greater	/spells/Stunning Barrier, Greater
2749	Sunder Breaker	/spells/Sunder Breaker
2750	Sundering Shards	/spells/Sundering Shards
2751	Symbol Of Laughter	/spells/Symbol Of Laughter
2752	Thorn Javelin	/spells/Thorn Javelin
2753	Thorny Entanglement	/spells/Thorny Entanglement
2754	Thunderstomp	/spells/Thunderstomp
2755	Thunderstomp, Greater	/spells/Thunderstomp, Greater
2756	Time Shudder	/spells/Time Shudder
2757	Triggered Suggestion	/spells/Triggered Suggestion
2758	Twilight Haze	/spells/Twilight Haze
2759	Unbearable Brightness	/spells/Unbearable Brightness
2760	Unholy Ice Weapon	/spells/Unholy Ice Weapon
2761	Unliving Rage	/spells/Unliving Rage
2762	Vampiric Shadow Shield	/spells/Vampiric Shadow Shield
2763	Wall Of Blindness/Deafness	/spells/Wall Of Blindness/Deafness
2764	Wall Of Nausea	/spells/Wall Of Nausea
2765	Whip Of Spiders	/spells/Whip Of Spiders
2766	Whip Of Ants	/spells/Whip Of Ants
2767	Whip Of Centipedes	/spells/Whip Of Centipedes
2768	Widen Auras	/spells/Widen Auras
2769	Semblance Of Flesh	/spells/Semblance Of Flesh
2770	Shared Suffering	/spells/Shared Suffering
2771	Wracking Ray	/spells/Wracking Ray
2772	Acid Maw	/spells/Acid Maw
2773	Arcane Disruption	/spells/Arcane Disruption
2774	Energy Hack	/spells/Energy Hack
2775	Imbue Hex	/spells/Imbue Hex
2776	Phantom Hunt	/spells/Phantom Hunt
2777	Spirit Call	/spells/Spirit Call
2778	Wrathful Weapon	/spells/Wrathful Weapon
2779	Aura Of Cannibalism	/spells/Aura Of Cannibalism
2780	Isolate	/spells/Isolate
2781	Control Vermin	/spells/Control Vermin
2782	Bloody Arrows	/spells/Bloody Arrows
2783	Mind Swap	/spells/Mind Swap
2784	Dust Ward	/spells/Dust Ward
2785	Ironskin	/spells/Ironskin
2786	Ice Slick	/spells/Ice Slick
2787	Magic Boulder	/spells/Magic Boulder
2788	Fleshy Facade	/spells/Fleshy Facade
2789	Hungry Earth	/spells/Hungry Earth
2790	Augmenting Wall	/spells/Augmenting Wall
2791	Calm Air	/spells/Calm Air
2792	Conversing Wind	/spells/Conversing Wind
2793	Rain Of Arrows	/spells/Rain Of Arrows
2794	Telekinetic Volley	/spells/Telekinetic Volley
2795	Bouncy Body	/spells/Bouncy Body
2796	Mud Buddy	/spells/Mud Buddy
2797	Endothermic Touch	/spells/Endothermic Touch
2798	Scale Spikes	/spells/Scale Spikes
2799	Scale Spikes, Greater	/spells/Scale Spikes, Greater
2800	Air Breathing	/spells/Air Breathing
2801	Blood In The Water	/spells/Blood In The Water
2802	Gift Of The Deep	/spells/Gift Of The Deep
2803	Spellsteal	/spells/Spellsteal
2804	Sundered Serpent Coil	/spells/Sundered Serpent Coil
2805	Curse Of Unexpected Death	/spells/Curse Of Unexpected Death
2806	Burdened Thoughts	/spells/Burdened Thoughts
2807	Hollow Blades	/spells/Hollow Blades
2808	Thought Shield IV	/spells/Thought Shield IV
2809	Runic Overload	/spells/Runic Overload
2810	Siphon Might	/spells/Siphon Might
2811	Stone Throwing	/spells/Stone Throwing
2812	Steal Size	/spells/Steal Size
2813	Twisted Futures	/spells/Twisted Futures
2814	Amplify Stench	/spells/Amplify Stench
2815	Mark Of The Reptile God	/spells/Mark Of The Reptile God
2816	Swarm Of Fangs	/spells/Swarm Of Fangs
2817	Mind Swap, Major	/spells/Mind Swap, Major
2818	Transfer Regeneration	/spells/Transfer Regeneration
2819	Trial Of Fire And Acid	/spells/Trial Of Fire And Acid
2820	Callback	/spells/Callback
2821	Callback, Greater	/spells/Callback, Greater
2822	Disrupt Link	/spells/Disrupt Link
2823	Duplicate Familiar	/spells/Duplicate Familiar
2824	Empathy Conduit	/spells/Empathy Conduit
2825	Merge With Familiar	/spells/Merge With Familiar
2826	Soulswitch	/spells/Soulswitch
2827	Transfer Familiar	/spells/Transfer Familiar
2828	Thought Shield V	/spells/Thought Shield V
2829	Beanstalk	/spells/Beanstalk
2830	Flaming Aura	/spells/Flaming Aura
2831	Frosty Aura	/spells/Frosty Aura
2832	Quick Throwing	/spells/Quick Throwing
2833	Thunderous Footfalls	/spells/Thunderous Footfalls
2834	Thanatotic Fury	/spells/Thanatotic Fury
2835	Titanic Anchoring	/spells/Titanic Anchoring
2836	Aura Of Inviolate Ownership	/spells/Aura Of Inviolate Ownership
2837	Blade Tutor's Spirit	/spells/Blade Tutor's Spirit
2838	Darting Duplicate	/spells/Darting Duplicate
2839	Dimensional Blade	/spells/Dimensional Blade
2840	Fiery Runes	/spells/Fiery Runes
2841	Instant Weapon	/spells/Instant Weapon
2842	Reaper's Coterie	/spells/Reaper's Coterie
2843	Rubberskin	/spells/Rubberskin
2844	Umbral Weapon	/spells/Umbral Weapon
2845	Vine Strike	/spells/Vine Strike
2846	Cheetah's Sprint	/spells/Cheetah's Sprint
2847	Clear Grove	/spells/Clear Grove
2848	Harmless Form	/spells/Harmless Form
2849	Globe Of Tranquil Water	/spells/Globe Of Tranquil Water
2850	Nature's Paths	/spells/Nature's Paths
2851	Oasis	/spells/Oasis
2852	Planar Refuge	/spells/Planar Refuge
2853	Raven's Flight	/spells/Raven's Flight
2854	Wild Instinct	/spells/Wild Instinct
2855	Gravel Vortex	/spells/Gravel Vortex
2856	Master's Mutation	/spells/Master's Mutation
2857	Daywalker	/spells/Daywalker
2858	Plant Voice	/spells/Plant Voice
2859	Spore Burst	/spells/Spore Burst
2860	Alter Summoned Monster	/spells/Alter Summoned Monster
2861	Final Sacrifice	/spells/Final Sacrifice
2862	Gird Ally	/spells/Gird Ally
2863	Instant Restoration	/spells/Instant Restoration
2864	Master's Escape	/spells/Master's Escape
2865	Summon Laborers	/spells/Summon Laborers
2866	Illusory Maze	/spells/Illusory Maze
2867	Make Lost	/spells/Make Lost
2868	Mind Maze	/spells/Mind Maze
2869	Puzzle Box	/spells/Puzzle Box
2870	Stoke The Inner Fire	/spells/Stoke The Inner Fire
2871	Akashic Form	/spells/Akashic Form
2872	Analyze Aura	/spells/Analyze Aura
2873	Anticipate Thoughts	/spells/Anticipate Thoughts
2874	Apport Object	/spells/Apport Object
2875	Apport Animal	/spells/Apport Animal
2876	Aura Alteration	/spells/Aura Alteration
2877	Drain Poison	/spells/Drain Poison
2878	Blend With Surroundings	/spells/Blend With Surroundings
2879	Garden Of Peril	/spells/Garden Of Peril
2880	Invigorating Poison	/spells/Invigorating Poison
2881	Neutralize Poison, Greater	/spells/Neutralize Poison, Greater
2882	Poison Breath	/spells/Poison Breath
2883	Sword To Snake	/spells/Sword To Snake
2884	Toxic Rupture	/spells/Toxic Rupture
2885	Venomous Bite	/spells/Venomous Bite
2886	Blessing Of Liberty	/spells/Blessing Of Liberty
2887	Body Double	/spells/Body Double
2888	Grasping Tentacles	/spells/Grasping Tentacles
2889	Grease, Greater	/spells/Grease, Greater
2890	Hide Weapon	/spells/Hide Weapon
2891	Selective Invisibility	/spells/Selective Invisibility
2892	Sense Vitals	/spells/Sense Vitals
2893	Shifting Shadows	/spells/Shifting Shadows
2894	Beloved Of The Forge	/spells/Beloved Of The Forge
2895	Harvest Season	/spells/Harvest Season
2896	Wall Of Clockwork	/spells/Wall Of Clockwork
2897	Cloak Of Secrets	/spells/Cloak Of Secrets
2898	Coin Shot	/spells/Coin Shot
2899	Ears Of The City	/spells/Ears Of The City
2900	Illusory Crowd	/spells/Illusory Crowd
2901	Create Mindscape	/spells/Create Mindscape
2902	Locksight	/spells/Locksight
2903	Peace Bond	/spells/Peace Bond
2904	Speak Local Language	/spells/Speak Local Language
2905	Aversion	/spells/Aversion
2906	Awaken Construct	/spells/Awaken Construct
2907	Babble	/spells/Babble
2908	Bilocation	/spells/Bilocation
2909	Burst Of Adrenaline	/spells/Burst Of Adrenaline
2910	Burst Of Insight	/spells/Burst Of Insight
2911	Call Spirit	/spells/Call Spirit
2912	Calm Spirit	/spells/Calm Spirit
2913	Catatonia	/spells/Catatonia
2914	Charge Object	/spells/Charge Object
2915	Cognitive Block	/spells/Cognitive Block
2916	Condensed Ether	/spells/Condensed Ether
2917	Contagious Zeal	/spells/Contagious Zeal
2918	Create Mindscape, Greater	/spells/Create Mindscape, Greater
2919	Decrepit Disguise	/spells/Decrepit Disguise
2920	Deja Vu	/spells/Deja Vu
2921	Demand Offering	/spells/Demand Offering
2922	Detect Mindscape	/spells/Detect Mindscape
2923	Detect Psychic Significance	/spells/Detect Psychic Significance
2924	Divide Mind	/spells/Divide Mind
2925	Mind Thrust I	/spells/Mind Thrust I
2926	Mind Thrust II	/spells/Mind Thrust II
2927	Dream Council	/spells/Dream Council
2928	Dream Scan	/spells/Dream Scan
2929	Dream Travel	/spells/Dream Travel
2930	Dream Voyage	/spells/Dream Voyage
2931	Ectoplasmic Eruption	/spells/Ectoplasmic Eruption
2932	Ghost Whip	/spells/Ghost Whip
2933	Ectoplasmic Snare	/spells/Ectoplasmic Snare
2934	Ego Whip I	/spells/Ego Whip I
2935	Ego Whip II	/spells/Ego Whip II
2936	Ego Whip III	/spells/Ego Whip III
2937	Ego Whip IV	/spells/Ego Whip IV
2938	Ego Whip V	/spells/Ego Whip V
2939	Emotive Block	/spells/Emotive Block
2940	Enshroud Thoughts	/spells/Enshroud Thoughts
2941	Entrap Spirit	/spells/Entrap Spirit
2942	Erase Impressions	/spells/Erase Impressions
2943	Ethereal Envelope	/spells/Ethereal Envelope
2944	Ethereal Envelopment	/spells/Ethereal Envelopment
2945	Ethereal Fists	/spells/Ethereal Fists
2946	Etheric Shards	/spells/Etheric Shards
2947	Explode Head	/spells/Explode Head
2948	Foster Hatred	/spells/Foster Hatred
2949	Inflict Pain	/spells/Inflict Pain
2950	Grave Words	/spells/Grave Words
2951	Hypercognition	/spells/Hypercognition
2952	Id Insinuation I	/spells/Id Insinuation I
2953	Id Insinuation II	/spells/Id Insinuation II
2954	Id Insinuation III	/spells/Id Insinuation III
2955	Id Insinuation IV	/spells/Id Insinuation IV
2956	Implant False Reading	/spells/Implant False Reading
2957	Incorporeal Chains	/spells/Incorporeal Chains
2958	Instigate Psychic Duel	/spells/Instigate Psychic Duel
2959	Intellect Fortress I	/spells/Intellect Fortress I
2960	Intellect Fortress II	/spells/Intellect Fortress II
2961	Intellect Fortress III	/spells/Intellect Fortress III
2962	Mental Barrier I	/spells/Mental Barrier I
2963	Mental Barrier II	/spells/Mental Barrier II
2964	Mental Barrier III	/spells/Mental Barrier III
2965	Mental Barrier IV	/spells/Mental Barrier IV
2966	Mental Barrier V	/spells/Mental Barrier V
2967	Mental Block	/spells/Mental Block
2968	Microcosm	/spells/Microcosm
2969	Mind Probe	/spells/Mind Probe
2970	Mindlink	/spells/Mindlink
2971	Mindscape Door	/spells/Mindscape Door
2972	Mindwipe	/spells/Mindwipe
2973	Node Of Blasting	/spells/Node Of Blasting
2974	Object Possession	/spells/Object Possession
2975	Object Possession, Greater	/spells/Object Possession, Greater
2976	Object Possession, Lesser	/spells/Object Possession, Lesser
2977	Object Reading	/spells/Object Reading
2978	Oneiric Horror	/spells/Oneiric Horror
2979	Oneiric Horror, Greater	/spells/Oneiric Horror, Greater
2980	Paranoia	/spells/Paranoia
2981	Parchment Swarm	/spells/Parchment Swarm
2982	Placebo Effect	/spells/Placebo Effect
2983	Possession	/spells/Possession
2984	Possession, Greater	/spells/Possession, Greater
2985	Primal Regression	/spells/Primal Regression
2986	Thoughtsense	/spells/Thoughtsense
2987	Psychic Asylum	/spells/Psychic Asylum
2988	Psychic Crush I	/spells/Psychic Crush I
2989	Psychic Crush II	/spells/Psychic Crush II
2990	Psychic Crush III	/spells/Psychic Crush III
2991	Psychic Crush IV	/spells/Psychic Crush IV
2992	Psychic Crush V	/spells/Psychic Crush V
2993	Psychic Image	/spells/Psychic Image
2994	Thought Echo	/spells/Thought Echo
2995	Psychic Reading	/spells/Psychic Reading
2996	Psychic Surgery	/spells/Psychic Surgery
2997	Purge Spirit	/spells/Purge Spirit
2998	Quintessence	/spells/Quintessence
2999	Remote Viewing	/spells/Remote Viewing
3000	Repress Memory	/spells/Repress Memory
3001	Retrocognition	/spells/Retrocognition
3002	Riding Possession	/spells/Riding Possession
3003	Sealed Life	/spells/Sealed Life
3004	Sealed Life, Greater	/spells/Sealed Life, Greater
3005	Sessile Spirit	/spells/Sessile Spirit
3006	Shadow Body	/spells/Shadow Body
3007	Spirit-Bound Blade	/spells/Spirit-Bound Blade
3008	Synapse Overload	/spells/Synapse Overload
3009	Synaptic Pulse	/spells/Synaptic Pulse
3010	Synaptic Pulse, Greater	/spells/Synaptic Pulse, Greater
3011	Thought Shield I	/spells/Thought Shield I
3012	Synaptic Scramble	/spells/Synaptic Scramble
3013	Synesthesia	/spells/Synesthesia
3014	Synesthesia, Mass	/spells/Synesthesia, Mass
3015	Talismanic Implement	/spells/Talismanic Implement
3016	Telekinetic Maneuver	/spells/Telekinetic Maneuver
3017	Telekinetic Projectile	/spells/Telekinetic Projectile
3018	Telekinetic Storm	/spells/Telekinetic Storm
3019	Telempathic Projection	/spells/Telempathic Projection
3020	Telepathy	/spells/Telepathy
3021	Thaumaturgic Circle	/spells/Thaumaturgic Circle
3022	Tower Of Iron Will I	/spells/Tower Of Iron Will I
3023	Tower Of Iron Will II	/spells/Tower Of Iron Will II
3024	Tower Of Iron Will III	/spells/Tower Of Iron Will III
3025	Tower Of Iron Will IV	/spells/Tower Of Iron Will IV
3026	Tower Of Iron Will V	/spells/Tower Of Iron Will V
3027	Unshakable Zeal	/spells/Unshakable Zeal
3028	Wall Of Ectoplasm	/spells/Wall Of Ectoplasm
3029	Withdraw Affliction	/spells/Withdraw Affliction
3030	Air Of Authority	/spells/Air Of Authority
3031	Bleaching Resistance	/spells/Bleaching Resistance
3032	Burn Corruption	/spells/Burn Corruption
3033	Champion's Bout	/spells/Champion's Bout
3034	Damnation Of Memory	/spells/Damnation Of Memory
3035	Elemental Mastery	/spells/Elemental Mastery
3036	Fable Tapestry	/spells/Fable Tapestry
3037	Fire's Friend	/spells/Fire's Friend
3038	Fleshwarping Swarm	/spells/Fleshwarping Swarm
3039	Lament Of Summer's Last Breath	/spells/Lament Of Summer's Last Breath
3040	Lost Passage	/spells/Lost Passage
3041	Lost Locale	/spells/Lost Locale
3042	Summon Giant Ally III	/spells/Summon Giant Ally III
3043	Mantle Of The Magic Warriors	/spells/Mantle Of The Magic Warriors
3044	Martial Telekinesis	/spells/Martial Telekinesis
3045	Miasmal Dread	/spells/Miasmal Dread
3046	Murderous Crow	/spells/Murderous Crow
3047	Overlook	/spells/Overlook
3048	Probe History	/spells/Probe History
3049	Respectful Quiet	/spells/Respectful Quiet
3050	Shadow Of Doubt	/spells/Shadow Of Doubt
3051	Siege Scatter	/spells/Siege Scatter
3052	Summon Giant Ally I	/spells/Summon Giant Ally I
3053	Summon Giant Ally II	/spells/Summon Giant Ally II
3054	Suppressing Stone	/spells/Suppressing Stone
3055	Wall Of Brine	/spells/Wall Of Brine
3056	Zephyr's Fleetness	/spells/Zephyr's Fleetness
3057	Create Drug	/spells/Create Drug
3058	Death Pact	/spells/Death Pact
3059	Fool's Teleport	/spells/Fool's Teleport
3060	Implanted Projection	/spells/Implanted Projection
3061	Contact High	/spells/Contact High
3062	Dream Shield	/spells/Dream Shield
3063	Jealous Rage	/spells/Jealous Rage
3064	Mindshock	/spells/Mindshock
3065	Psychic Leech	/spells/Psychic Leech
3066	Quell Energy	/spells/Quell Energy
3067	Retributive Reparations	/spells/Retributive Reparations
3068	Sensory Amplifier	/spells/Sensory Amplifier
3069	Subjective Reality	/spells/Subjective Reality
3070	Ectoplasmic Hand	/spells/Ectoplasmic Hand
3071	Mantle Of Doubt	/spells/Mantle Of Doubt
3072	Mind Over Matter	/spells/Mind Over Matter
3073	Out Of Sight	/spells/Out Of Sight
3074	Phantom Limb	/spells/Phantom Limb
3075	Psychonaut Manifestation	/spells/Psychonaut Manifestation
3076	Alleviate Addiction	/spells/Alleviate Addiction
3077	Imbue With Addiction	/spells/Imbue With Addiction
3078	Night Blindness	/spells/Night Blindness
3079	Pesh Vigor	/spells/Pesh Vigor
3080	Codespeak	/spells/Codespeak
3081	Compel Tongue	/spells/Compel Tongue
3082	Compel Tongue, Mass	/spells/Compel Tongue, Mass
3083	Fleeting Memory	/spells/Fleeting Memory
3084	Fleeting Memory, Mass	/spells/Fleeting Memory, Mass
3085	Secret Sign	/spells/Secret Sign
3086	Venomous Promise	/spells/Venomous Promise
3087	Arcane Pocket	/spells/Arcane Pocket
3088	Vacuous Vessel	/spells/Vacuous Vessel
3089	Adroit Retrieval	/spells/Adroit Retrieval
3090	Authenticating Gaze	/spells/Authenticating Gaze
3091	Curse Of Keeping	/spells/Curse Of Keeping
3092	Evaluator's Lens	/spells/Evaluator's Lens
3093	Fleeting Defect	/spells/Fleeting Defect
3094	Incendiary Runes	/spells/Incendiary Runes
3095	Peerless Integrity	/spells/Peerless Integrity
3096	Remarkable Legerdemain	/spells/Remarkable Legerdemain
3097	Secret Coffer	/spells/Secret Coffer
3098	Secret Vault	/spells/Secret Vault
3099	Shadow Enchantment	/spells/Shadow Enchantment
3100	Shadow Enchantment, Greater	/spells/Shadow Enchantment, Greater
3101	Detect Fiendish Presence	/spells/Detect Fiendish Presence
3102	Devil Snare	/spells/Devil Snare
3103	Punishing Armor	/spells/Punishing Armor
3104	Unholy Ward	/spells/Unholy Ward
3105	Blood Tentacles	/spells/Blood Tentacles
3106	Caustic Safeguard	/spells/Caustic Safeguard
3107	Coward's Cowl	/spells/Coward's Cowl
3108	Dream Dalliance	/spells/Dream Dalliance
3109	Enticing Adulation	/spells/Enticing Adulation
3110	Furious Fire Barrage	/spells/Furious Fire Barrage
3111	Golden Guise	/spells/Golden Guise
3112	Shadow Endurance	/spells/Shadow Endurance
3113	Seer's Bane	/spells/Seer's Bane
3114	Aroden's Magic Army	/spells/Aroden's Magic Army
3115	Aroden's Spellsword	/spells/Aroden's Spellsword
3116	Banishing Blade	/spells/Banishing Blade
3117	Create Armaments	/spells/Create Armaments
3118	Linked Legacy	/spells/Linked Legacy
3119	Expeditious Construction	/spells/Expeditious Construction
3120	Force Sword	/spells/Force Sword
3121	Grand Destiny	/spells/Grand Destiny
3122	Guardian Monument, Lesser	/spells/Guardian Monument, Lesser
3123	Guardian Monument, Greater	/spells/Guardian Monument, Greater
3124	Human Potential	/spells/Human Potential
3125	Human Potential, Mass	/spells/Human Potential, Mass
3126	Last Azlanti's Defending Sword	/spells/Last Azlanti's Defending Sword
3127	Last Azlanti's Defending Sword, Mass	/spells/Last Azlanti's Defending Sword, Mass
3128	Splinter Spell Resistance	/spells/Splinter Spell Resistance
3129	Winged Sword	/spells/Winged Sword
3130	Celestial Healing	/spells/Celestial Healing
3131	Celestial Healing, Greater	/spells/Celestial Healing, Greater
3132	Cyclic Reincarnation	/spells/Cyclic Reincarnation
3133	Jatembe's Ire	/spells/Jatembe's Ire
3134	Mask From Divination	/spells/Mask From Divination
3135	Full Pouch	/spells/Full Pouch
3136	Planar Inquiry	/spells/Planar Inquiry
3137	Artificer's Curse	/spells/Artificer's Curse
3138	Deft Digits	/spells/Deft Digits
3139	Dissolution	/spells/Dissolution
3140	Emblem Of Greed	/spells/Emblem Of Greed
3141	Fool's Gold	/spells/Fool's Gold
3142	Legendary Proportions	/spells/Legendary Proportions
3143	Liquefy	/spells/Liquefy
3144	Open Arms	/spells/Open Arms
3145	Rags To Riches	/spells/Rags To Riches
3146	Rune Of Ruin	/spells/Rune Of Ruin
3147	Tears To Wine	/spells/Tears To Wine
3148	Transmute Golem	/spells/Transmute Golem
3149	Find Fault	/spells/Find Fault
3150	Foretell Failure	/spells/Foretell Failure
3151	Perfect Placement	/spells/Perfect Placement
3152	Heckle	/spells/Heckle
3153	Stage Fright	/spells/Stage Fright
3154	Tough Crowd	/spells/Tough Crowd
3155	First World Revisions	/spells/First World Revisions
3156	Darkvault	/spells/Darkvault
3157	Fear The Sun	/spells/Fear The Sun
3158	Ignoble Form	/spells/Ignoble Form
3159	Shadowmind	/spells/Shadowmind
3160	Umbral Strike	/spells/Umbral Strike
3161	Dancing Darkness	/spells/Dancing Darkness
3162	Motes Of Dusk And Dawn	/spells/Motes Of Dusk And Dawn
3163	Mydriatic Spontaneity	/spells/Mydriatic Spontaneity
3164	Mydriatic Spontaneity, Mass	/spells/Mydriatic Spontaneity, Mass
3165	Penumbral Disguise	/spells/Penumbral Disguise
3166	Shield Of Darkness	/spells/Shield Of Darkness
3167	Shadow Trap	/spells/Shadow Trap
3168	Spotlight	/spells/Spotlight
3169	Touch Of Blindness	/spells/Touch Of Blindness
3170	Wall Of Split Illumination	/spells/Wall Of Split Illumination
3171	Baleful Shadow Transmutation	/spells/Baleful Shadow Transmutation
3172	Masochistic Shadow	/spells/Masochistic Shadow
3173	Shadow Transmutation	/spells/Shadow Transmutation
3174	Shadow Transmutation, Greater	/spells/Shadow Transmutation, Greater
3175	Shadowform	/spells/Shadowform
3176	Umbral Infusion	/spells/Umbral Infusion
3177	Umbral Infusion, Mass	/spells/Umbral Infusion, Mass
\.


--
-- Name: phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('phrases_id_seq', 3181, true);


--
-- Name: phrases_phrase_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY phrases
    ADD CONSTRAINT phrases_phrase_key UNIQUE (phrase);


--
-- Name: phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY phrases
    ADD CONSTRAINT phrases_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

