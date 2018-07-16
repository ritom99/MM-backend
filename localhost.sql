-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 16, 2018 at 05:07 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `News`
--
CREATE DATABASE IF NOT EXISTS `News` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `News`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'notapproved'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forumposts`
--

CREATE TABLE `forumposts` (
  `post_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` text NOT NULL,
  `post` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'approved'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumposts`
--

INSERT INTO `forumposts` (`post_id`, `slug`, `created_by`, `date`, `title`, `post`, `status`) VALUES
(0, 'hello_world', 'ritom', '2018-07-02 00:00:00', 'Hello World', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su', 'approved'),
(4, 'pussinboots', 'pussinboots', '2018-07-03 00:00:00', 'pussinboots', 'hello everyone just trying out my new forum.', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `forumthread`
--

CREATE TABLE `forumthread` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `body` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumthread`
--

INSERT INTO `forumthread` (`comment_id`, `post_id`, `user`, `date`, `body`) VALUES
(1, 0, 'riotm', '2018-07-03 18:33:37', 'lipsum sucks'),
(3, 4, 'ritom', '2018-07-03 18:33:37', 'hello i tiyom');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `title`, `image`, `info`, `date`) VALUES
(0, 'DATEV Challenge Roth 2018 in Roth', 'main_1200_(1).jpg', 'From left: Andreas Dreitz from Germany and Jesse Thomas react after finishing the DATEV Challenge Roth 2018 in Roth, Germany, on July 1, 2018', '2018-07-07 17:27:18'),
(1, 'The Long Goodbye', '4C7B6FA400000578-5751257-image-a-9_1526887076730.jpg', 'Barefooted Andrés Iniesta sits alone in empty stadium until 1am savouring his last moments as a Barca player.', '2018-06-01 00:00:00'),
(2, 'Budapest, 11 May', 'main_1200.jpg', 'Fire performers celebrate the 250-year-old contemporary circus in Budapest, Hungary, on May 11, 2018.', '2018-05-31 00:00:00'),
(3, 'Real wins 3rd consecutive Champions League title ', '_101770854_real-pa.jpg', 'Real tops Liverpool in final to win 4th title in 5 years', '2018-06-07 00:00:00'),
(4, 'Cannes Festival 2018', 'Cannes-Film_Festival_2018.jpg', 'The 71st annual Cannes Film Festival was held from 8 to 19 May 2018 for 12 days.', '2018-06-01 00:00:00'),
(5, 'Nadal wins Italian Open', '_101652411_gettyimages-960528214.jpg', 'Rafael Nadal survived a stunning fightback from Alexander Zverev to win a record eighth Italian Open.', '2018-05-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `id` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `E` varchar(255) NOT NULL,
  `F` varchar(255) NOT NULL,
  `G` varchar(255) NOT NULL,
  `H` varchar(255) NOT NULL,
  `I` varchar(255) NOT NULL,
  `J` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` text NOT NULL,
  `body` text NOT NULL,
  `views` int(10) NOT NULL DEFAULT '0',
  `featured` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `category`, `slug`, `image`, `info`, `date`, `author`, `body`, `views`, `featured`) VALUES
(1, 'How fortnite captured teen\'s minds and hearts', 'Business and Tech', 'how_fortnite_captured_teens_minds_and_hearts', '180521_r32092.jpg', 'The craze for the third-person shooter game has elements of Beatlemania, the opioid crisis, and eating Tide Pods.', '2018-05-31 00:00:00', 'By Nick Paumgarten', '<p>It was getting late in Tomato Town. The storm was closing in, and meteors pelted the ground. Gizzard Lizard had made his way there after plundering the sparsely populated barns and domiciles of Anarchy Acres, then by avoiding the Wailing Woods and keeping the storm just off to his left. He spied an enemy combatant on high ground, who appeared to have a sniper’s rifle. In a hollow below the sniper’s perch was an abandoned pizzeria, with a giant rotating sign in the shape of a tomato. Gizzard Lizard, who had quickly built himself a redoubt of salvaged beams, said, “I think I’m going to attack. That’s one of my main issues: I need to start being more aggressive.” He ran out into the open, pausing before a thick shrub. “This is actually a really good bush. I could bush-camp. But naw, that’s what noobs do.”</p>\r\n\r\n<p>Two men enter, one man leaves: the fighters closed in on each other. In the video game Fortnite Battle Royale, the late-game phase is typically the most frenetic and exciting. Suddenly, the sniper launched himself into a nearby field and began attacking. Gizzard Lizard hastily threw up another port-a-fort, amid a hail of enemy fire. The goal is always to get, or make, the high ground.</p>\r\n\r\n<p>A moment later, Gizzard Lizard was dead—killed by a grenade. Afterward, he replayed the ending, from various vantages, to analyze what had gone wrong. To be so close to winning and yet come up short—it was frustrating and tantalizing. One wants to go again. The urge is strong. But it was time for my son to do his homework.</p>\r\n\r\n<p>I spent more time as a kid than I care to remember watching other kids play video games. Space Invaders, Asteroids, Pac-Man, Donkey Kong. Usually, my friends, over my objections, preferred this to playing ball—or to other popular, if less edifying, neighborhood pursuits, such as tearing hood ornaments off parked cars. Every so often, I played, too, but I was a spaz. Insert quarter, game over. Once gaming moved into dorms and apartments—Nintendo, Sega—I learned that I could just leave. But sometimes I didn’t. I admired the feat of divided attention, the knack that some guys (and it was always guys) seemed to have for staying alive, both in the game and in the battle of wits on the couch, as though they were both playing a sport and doing “SportsCenter” at the same time.</p>\r\n\r\n<p>Fortnite, for anyone not a teen-ager or a parent or educator of teens, is the third-person shooter game that has taken over the hearts and minds—and the time, both discretionary and otherwise—of adolescent and collegiate America. Released last September, it is right now by many measures the most popular video game in the world. At times, there have been more than three million people playing it at once. It has been downloaded an estimated sixty million times. (The game, available on PC, Mac, Xbox, PS4, and mobile devices, is—crucially—free, but many players pay for additional, cosmetic features, including costumes known as “skins.”) In terms of fervor, compulsive behavior, and parental noncomprehension, the Fortnite craze has elements of Beatlemania, the opioid crisis, and the ingestion of Tide Pods. Parents speak of it as an addiction and swap tales of plunging grades and brazen screen-time abuse: under the desk at school, at a memorial service, in the bathroom at 4 a.m. They beg one another for solutions. A friend sent me a video he’d taken one afternoon while trying to stop his son from playing; there was a time when repeatedly calling one’s father a fucking asshole would have led to big trouble in Tomato Town. In our household, the big threat is gamer rehab in South Korea.</p>\r\n\r\n<p>Game fads come and go: Rubik’s Cube, Dungeons & Dragons, Angry Birds, Minecraft, Clash of Clans, Pokémon Go. What people seem to agree on, whether they’re seasoned gamers or dorky dads, is that there’s something new emerging around Fortnite, a kind of mass social gathering, open to a much wider array of people than the games that came before. Its relative lack of wickedness—it seems to be mostly free of the misogyny and racism that afflict many other games and gaming communities—makes it more palatable to a broader audience, and this appeal both ameliorates and augments its addictive power. (The game, in its basic mode, randomly assigns players’ skins, which can be of any gender or race.) Widespread anecdotal evidence suggests that girls are playing in vast numbers, both with and without boys. There are, and probably ever shall be, some gamer geeks who gripe at such newcomers, just as they gripe when there are no newcomers at all.</p>\r\n\r\n<p>Shall I explain the game? I have to, I’m afraid, even though describing video games is a little like recounting dreams. A hundred players are dropped onto an island—from a flying school bus—and fight one another to the death. The winner is the last one standing. (You can pair up or form a squad, too.) This is what is meant by Battle Royale. (The original version of Fortnite, introduced last July, for forty dollars, wasn’t fight to the death; it is the new iteration that has caught fire.) A storm encroaches, gradually forcing combatants into an ever-shrinking area, where they must kill or be killed. Along the way, you seek out caches of weapons, armor, and healables, while also collecting building materials by breaking down existing structures. Hasty fabrication (of ramps, forts, and towers) is an essential aspect of the game, and this is why it is commonly described as a cross between Minecraft and the Hunger Games—and why aggrieved parents are able to tell themselves that it is constructive.</p>\r\n\r\n<p>Before a game begins, you wander around in a kind of purgatorial bus depot-cum-airfield waiting until the next hundred have assembled for an airdrop. This is a strange place. Players shoot inconsequentially at one another and pull dance moves, like actors walking aimlessly around backstage practicing their lines. Then come the airlift and the drifting descent, via glider, to the battleground, with a gentle whooshing sound that is to the Fortnite addict what the flick of a Bic is to a smoker. You can land in one of twenty-one areas on the island, each with a cutesy alliterative name, some suggestive of mid-century gay bars: Shifty Shafts, Moisty Mire, Lonely Lodge, Greasy Grove. In patois and in mood, the game manages to be both dystopian and comic, dark and light. It can be alarming, if you’re not accustomed to such things or are attuned to the news, to hear your darlings shouting so merrily about head shots and snipes. But there’s no blood or gore. The violence is cartoonish, at least relative to, say, Halo or Grand Theft Auto. Such are the consolations.</p>\r\n\r\n<p>Players, young ones anyway, don’t seem to notice such things. They’re after assault rifles (preferably the Legendary scar), pump shotguns, bolt-action sniper rifles (the scope is a boon), chug jugs, slurp juices, bandages, medkits, and shield potions. They see, and covet, skins that look cool but have no bearing on game play; for twenty bucks, you can don the Leviathan or the Raven. Or they fixate on dance moves, the so-called victory emotes you can have your avatar perform, in the heat of battle or after a kill. The Floss, the Fresh, the Squat Kick, the Wiggle—these have spilled out into the world. You may notice people around you, or professional athletes on TV, breaking into strange dances. The one known as Take the L is big these days in the Bundesliga and at Minute Maid Park.</p>\r\n\r\n<p>“Think of Fortnite as a visual form of media,” Jamin Warren, the editor of the culture-and-gaming journal Kill Screen, told me. Whatever Fortnite’s allure as a game to play, it is also apparently the most beguiling one to watch. As video-game spectatorship fills arenas, and siphons a generation away from actual sports, Fortnite has become the most viewed game on YouTube—by March, there had been almost three billion views of the millions of sessions that players had uploaded—and the top game on Twitch, the streaming platform. Watching isn’t just for spazzes anymore. “It’s created a kind of global arcade,” Warren said. “Instead of a few kids looking over the shoulder of the hot-shot older brother or whatever, down at the mall, you have millions of people watching, and the person playing the game is a millionaire.”</p>\r\n\r\n<p>The medium’s breakout star is known as Ninja. He is a former professional Halo player named Tyler Blevins, who has said that he makes more than half a million dollars a month by streaming his Fortnite sessions, and his free-associative commentary, on Twitch (which is owned by Amazon). His YouTube channel has more than ten million subscribers. Last month, he hosted a Fortnite tournament in Las Vegas, in an e-sports arena, and almost seven hundred thousand people tuned in to his Twitch stream. I’ve heard many teens refer to him as America’s biggest entertainer—which is not as hyperbolic as it sounds. In April, Ninja ranked higher than any athlete in the world in “social interactions,” a measure of social-media likes, comments, shares, and views. Cristiano Ronaldo was No. 2. In March, Ninja consented to a Fortnite session with Drake.</p>\r\n\r\n<p>As the last hours of Season 3 expired, players scrambled to reach Tier 100, and get their John Wick skins. Gizzard Lizard was nowhere close. He’d started the season as a noob. Come the next morning, Day One of Season 4, he had a plan to put in the hours to get to Tier 100. It would take serious commitment. For the first time, he purchased a thousand Fortnite V-bucks, for $9.99, with which to buy skins. He went with the Carbide, a sleek one that brought to mind a wetsuit. This was the first time he—or, more to the point, his parents—had ever spent anything but quarters on a game.</p>', 13, 1),
(2, 'How Julian Assange became an unwelcome guest in Ecuador\'s embassy', 'Business and Tech', 'how_julian_assange_became_an_unwelcome_guest_in_ecuadors_embassy', '2303.jpg', 'He has been in the Knightsbridge building for six years, but his departure looks ever more likely.', '2018-05-28 00:00:00', 'By Luke Harding', '<p>In June 2012, a tall, mysterious figure turned up at the Ecuadorian embassy in London. He rang the bell, walked in and asked for political asylum.</p>\r\n\r\n<p>It was Julian Assange. Days earlier, he had lost his long legal fight against extradition to Sweden, where two women accused him of rape.</p>\r\n\r\n<p>Soon afterwards, the left-leaning then president of Ecuador, Rafael Correa, agreed to Assange’s request, precipitating a major diplomatic row with the British government. And a full-blown siege. Metropolitan police officers swarmed outside the building, ready to arrest Assange should he venture out.</p>\r\n\r\n<p>It was against this febrile backdrop that Correa authorised a secret programme named “Operation Guest”. It was later renamed “Operation Hotel”. The guest was Assange, politely referred to as el huésped.</p>\r\n\r\n<p>The goal, at first, was to stop detectives bursting into the modest ground-floor embassy and dragging Assange away.</p>\r\n\r\n<p>But documents seen by the Guardian show it developed into something more complex. The aim seems to have changed from protecting Assange – which propped up WikiLeaks in the process – to spying on him.</p>\r\n\r\n<p>Whatever its aims, WikiLeaks was able to keep going up to and beyond its role in the 2016 US presidential election, with all the seismic consequences.</p>\r\n\r\n<p>It was WikiLeaks that published hacked emails belonging to the Democratic National Committee (DNC) and senior Democratic officials, leading to claims that it was part of an alleged Kremlin plot to undermine Hillary Clinton and help Donald Trump.</p>\r\n\r\n<p>Assange has refused to say how the emails got to WikiLeaks. He denies they came from a “state actor”. The FBI does not appear to believe him. Giving evidence last year, the agency’s then director, James Comey, told Congress that Moscow was behind the DNC cyber-raid. An “intermediary”, he said, passed the emails to WikiLeaks.</p>\r\n\r\n<p>Assange’s relationship with Moscow is certainly longstanding. In 2011, he signed a deal with the Kremlin-owned television network RT. The Julian Assange Show featured 10 guests, including Correa. Weeks after Assange’s interview with Correa was broadcast, the Australian sought refuge in the Ecuadorian embassy.</p>\r\n\r\n<p>The logs record that Assange had more than 80 visitors in one month in 2016. They included the WikiLeaks staff member Sarah Harrison and longtime supporters such as Craig Murray, the UK’s former ambassador to Uzbekistan. Another was the Croatian philosopher Sre?ko Horvat.</p>\r\n\r\n<p>There were also visits from Assange’s lawyer Gareth Peirce and Vaughan Smith, the founder of the Frontline Club, who hosted WikiLeaks at his Norfolk mansion for 13 months up until Assange jumped bail. On 23 June 2016, RT broadcast a referendum special from inside the embassy, with the final guests leaving at 4.30am.</p>\r\n\r\n<p>The external surveillance team wrote up descriptions of these encounters. They were sent back to Senain and Correa, sources say. The then Ecuadorian foreign minister, Ricardo Patiño, visited Assange in London, talking with him into the early hours, and criticised Britain for failing to find a solution to the standoff. The UK was unmoved. Asked what the government planned to do about Assange, the then foreign minister, Hugo Swire, said: “Not my stone, not my shoe.”</p>\r\n\r\n<p>Correa had no immediate comment on the operation. He has previously decried the UK’s attempts to arrest Assange, saying his country would not tolerate “colonialism of any kind”.</p>\r\n\r\n<p>Meanwhile, leaked invoices show the Ecuadorian government spent as much as $28m on surveillance equipment, sold only to states. What it was used for and by whom is unclear.</p>', 2, 0),
(3, 'Is Capitalism a Threat to Democracy?', 'Business and Tech', 'is_capitalism_a_threat_to_democracy', '180514_r32053_rd1.jpg', 'The idea that authoritarianism attracts workers harmed by the free market, which emerged when the Nazis were in power, has been making a comeback.', '2018-05-29 00:00:00', 'By Caleb Crainax', '<p>In London, in the nineteen-thirties, the émigré Hungarian intellectual Karl Polanyi was known among his friends as “the apocalyptic chap.” His gloom was understandable. Nearly fifty, he’d had to leave his wife, daughter, and mother behind in Vienna shortly after Austria lurched toward fascism, in 1933. Although he had long edited and contributed to the prestigious Viennese weekly The Austrian Economist, which published such celebrated figures as Friedrich Hayek and Joseph Schumpeter, he had come to discount his career as a thing of “theoretical and practical barrenness,” and blamed himself for failing to diagnose his era’s crucial political conflict. As so often for refugees, money was tight. Despite letters of reference from eminent historians, Polanyi failed to land a professorship or a fellowship, though he did manage to earn thirty-seven pounds co-editing an anti-fascist anthology, which featured essays by W. H. Auden and Reinhold Niebuhr. In his own contribution to the book, he argued that fascism strips democratic politics away from human society so that “only economic life remains,” a skeleton without flesh.</p>\r\n\r\n<p>In 1937, he taught in adult-education programs in Kent and Sussex, commuting by bus or train and spending the night at a student’s house if it got too late to return home. The subject was British economic history, which he hadn’t much studied before. As he learned how capitalism had challenged the political system of Great Britain, the first nation in the world to industrialize, he decided that it was no accident that fascism was infecting countries as disparate as Japan, Croatia, and Portugal. Fascism shouldn’t be “ascribed to local causes, national mentalities, or historical backgrounds,” he came to believe. It shouldn’t even be thought of as a political movement. It was, rather, an “ever-given political possibility”—a reflex that could occur in any polity experiencing a certain kind of pain. In Polanyi’s opinion, whenever the profit-making impulse becomes deadlocked with the need to shield people from its harmful side effects, voters are tempted by the “fascist solution”: reconcile profit and security by forfeiting civic freedom. The insight became the keystone of his masterpiece, “The Great Transformation,” which was published in 1944, as the world was coming to terms with the destruction that fascism had wrought.</p>\r\n\r\n<p>Today, as in the nineteen-thirties, strongmen are ascendant worldwide, purging civil servants, subverting the judiciary, and bullying the press. In a sweeping, angry new book, “Can Democracy Survive Global Capitalism?” (Norton), the journalist, editor, and Brandeis professor Robert Kuttner champions Polanyi as a neglected prophet. Like Polanyi, he believes that free markets can be crueller than citizens will tolerate, inflicting a distress that he thinks is making us newly vulnerable to the fascist solution. In Kuttner’s description, however, today’s political impasse is different from that of the nineteen-thirties. It is being caused not by a stalemate between leftist governments and a reactionary business sector but by leftists in government who have reneged on their principles. Since the demise of the Soviet Union, Kuttner contends, America’s Democrats, Britain’s Labour Party, and many of Europe’s social democrats have consistently tacked rightward, relinquishing concern for ordinary workers and embracing the power of markets; they have sided with corporations and investors so many times that, by now, workers no longer feel represented by them. When strongmen arrived promising jobs and a shared sense of purpose, working-class voters were ready for the message.</p>\r\n\r\n<p>Born in 1886 in Vienna, Karl Polanyi grew up in Budapest, in an assimilated, highly cultured Jewish family. Polanyi’s father, an engineer who became a railroad contractor, was so conscientious that when his business failed, around 1900, he repaid the shareholders, plunging the family into genteel poverty. Polanyi’s mother founded a women’s college, hosted a salon, and had a somewhat chaotic personality that a daughter-in-law once likened to “a book not yet written.” At home, as Gareth Dale recounts in a thoughtful 2016 biography, the family spoke German, French, and a little Hungarian; Karl also learned English, Latin, and Greek as a child. “I was taught tolerance not only by Goethe,” he later recalled, “but also, with seemingly mutually exclusive accents, by Dostoyevsky and John Stuart Mill.”</p>\r\n\r\n<p>After university, Polanyi helped to found Hungary’s Radical Citizens’ Party, which called for land redistribution, free trade, and extended suffrage. But he remained enough of a traditionalist to enlist as a cavalry officer shortly after the First World War broke out. At the front, where, he said, “the Russian winter and the blackish steppe made me feel sick at heart,” he read “Hamlet” obsessively, and wrote letters home asking his family to send volumes of Marx, Flaubert, and Locke. After the war, the Radical Citizens took power, but they fumbled it. In the short-lived Communist government that followed, Polanyi was offered a position in the culture ministry by his friend György Lukács, later a celebrated Marxist literary critic.</p>', 27, 0),
(4, 'Five most expensive stocks in Indian market', 'Business and Tech', 'five_most_expensive_stocks_in_indian_market', 'stocks5_660_051718061808.jpg', 'The price of a stock is a key factor in deciding the constituents of a portfolio or stock picks.', '2018-05-30 00:00:00', 'By Michael Simon', '<p>The price of a stock is a key factor in deciding the constituents of a portfolio or stock picks. High-priced stocks add more weightage to the portfolio but leave lesser money in the hands of investors/ traders. We look at top five stocks, which are the most expensive in the Indian share market.</p>\r\n\r\n<p><strong>MRF: Rs 74,353</strong></p>\r\n\r\n<p>Indian tyre manufacturer MRF is the most expensive stock in the Indian market. The firm\'s market capitalisation on BSE stands at Rs 31,644 crore. The stock hit its all-time high level of 81,423 on April 30, 2018.  The stock is up 2.77% since the beginning of this year and has risen 9.20% during the last one year.  Face value of the MRF stock is Rs 10.</p>\r\n\r\n<p>MRF reported a 20.41 per cent rise in its net profit at Rs 345.32 crore for the fourth quarter ended March 31, 2018 compared with net profit of Rs 286.77 crore during the same period of the previous fiscal.</p>\r\n\r\n<p>Total income rose to Rs 3,944.75 crore for the fourth quarter, as compared with Rs 3,778.23 crore in the same period of 2016-17, MRF said. The company also recommended a final dividend of Rs 54 per share.</p>\r\n\r\n<p>The firm is engaged in the manufacture and sale of automotive tires, tubes and flaps, among others. The company also manufactures rubber products, such as tread rubber and conveyor belt.</p>\r\n\r\n\r\n<p><strong>Eicher Motors: Rs 30,710</strong></p>\r\n\r\n<p>The flagship firm of the Eicher Group owns the iconic Royal Enfield motorcycle business in India. The Eicher Motors stock hit its 52-week high of Rs 33,483 on September 8, 2017. It is up 1.39% since the beginning of this year.  During the last one year, the stock has risen 5.48%.</p>\r\n\r\n<p>Motilal Oswal has given a target price of Rs 34,714 for the stock. \"Eicher Motors trades at 29x/22.6x FY19E/20E consolidated earnings per share. We maintain our multiple (P/E of 27x for RE and EV/EBITDA of 10x for Volvo Eicher Commercial Vehicles Limited (VECV). Reiterating Buy with a TP of INR 34, 714 ( March 20 SOTP -based),\" the brokerage said in a report on May 9, 2018 when the  stock price stood at 30,305.</p>\r\n\r\n<p>ICICI Direct.Com has given a target price of 35,600 on May 12, 2018. The stock price stood at Rs 30,888 at the time of stock recommendation.</p>\r\n\r\n<p>Garment manufacturer Page Industries is third on the list of most expensive Indian stocks. The stock is down over 7%  since the beginning of this year. It has gained 57.23% during the last one year. The market capitalisation of the stock stands at Rs 26,321 crore.  The Page Industries stock hit a fresh 52-week high of 25,779 on December 19, 2017.</p>\r\n\r\n<p>Page Industries is engaged in the business of manufacturing and trading of garments. The firm offers knitted garments. The firm offers a range of products for men, women and children. It is engaged in the manufacturing, distribution and marketing of Jockey products. The company holds licence of SPEEDO, an international brand for swim wear.</p>\r\n\r\n\r\n<p><strong>3M India: Rs 20,228</strong></p>\r\n\r\n<p>Bangalore-based company 3M India\'s stock has risen 4.73% since the beginning of this year.  During the last one year, the stock has gained 42.22% .</p>\r\n\r\n<p>The stock hit its 52-week high of 22,563 on February 12, 2018 and its 52 week low of 12,730 on BSE.</p>\r\n\r\n<p>The company\'s segments include industrial segment, which offers tapes, adhesives, advanced ceramics, sealants, specialty materials, closure systems for personal hygiene products, as well as offers scotch masking tape, scotch filament tape and scotch packaging tape; packaging equipment, and 3M VHB Bonding Tapes.</p>\r\n\r\n\r\n<p><strong>Bosch: Rs 18,090</strong></p>\r\n\r\n<p>The stock of automotive products firm Bosch Limited is the fifth most expensive in the Indian market. The stock is down nearly 10% since the beginning of this year.  During the last one year, the stock has fallen 25.34%  on BSE.</p>\r\n\r\n<p>On June 19, 2017, the stock hit its 52 week high level of 25,245. The stock touched its 52 week low of 16,990 on March 23, 2018.</p>\r\n\r\n<p>The company operates in the manufacturing and trading of automotive products. Its segments include automotive products and others. The company offers products, including fuel injection equipment and components; injectors, nozzles and nozzle holders, and starter motors and generators. It has presence across automotive technology, industrial technology, consumer goods and energy and building technology.</p>', 1, 0),
(5, 'Do foreign players still find Indian AMC business appealing?', 'Business and Tech', 'do_foreign_players_still_find_indian_amc_business_appealing', 'moneymutualfunds-770x433.jpg', 'Global investors across the board are of the view that the Indian economy is poised for significant growth.', '2018-05-30 00:00:00', 'By Himadri Buch', '<p>On one hand, we are seeing exits of foreign partners from the domestic mutual fund industry while on the other hand, a set of global players still find the Indian mutual fund industry attractive.</p>\r\n\r\n    <p>On Thursday, Union Bank of India said that Japan\'s financial major Dai-ichi Life Holdings has acquired 39.62 percent stake in Union Asset Management Co Ltd through investment in compulsorily convertible preference shares.</p>\r\n\r\n    <p>Accordingly, Union Mutual Fund will now be co-sponsored by Union Bank of India and Dai-ichi Life, the release said.</p>\r\n\r\n    <p>Dai-ichi has replaced Belgium-based KBC Participations Renta SA, which exited the venture by selling its 49 percent stake in erstwhile Union KBC Asset Management Co Pvt Ltd and Union KBC Trustee Co Pvt Ltd to Union Bank of India on Sep 20.</p>\r\n\r\n    <p>The entry of the Japanese fund with deep pockets will not only raise the prospects of Union Mutual Fund, but also accelerate the competition in an industry which is growing at 26 percent a year.</p>\r\n\r\n    <p>Another global asset manager, BlackRock, which exited AMC joint venture with DSP in India, is said to be keen on continuing its presence in the Indian AMC business.</p>\r\n\r\n    <p>According to reports, BlackRock has bid for acquiring IDFC AMC which is up for sale. So as the Indian mutual fund industry moves up the maturity curve, assets under management maintain the growth momentum clocking a CAGR of 26 percent global players are finding the industry appealing. The 43-player domestic mutual fund industry manages assets worth Rs 23 lakh crore as on March-end.</p>\r\n\r\n    <p>Japan\'s Nippon owns a stake in Reliance Asset Management which is listed on the stock exchanges. Global players like Prudential and Franklin Templeton dominate the industry.</p>\r\n\r\n    <p>Global investors across the board are of the view that the Indian economy is poised for significant growth.</p>\r\n\r\n    <p>However, in the past, some of the foreign MFs that have bid adieu to India include Morgan Stanley, PineBridge, ING, and Fidelity.</p>\r\n\r\n    <p>The main reason why few foreign MFs find India a difficult market to operate in is because they are unable to scale up their asset base. Even when some of these players manage to build a substantial equity asset base, the high cost of operations eats into profitability.</p>\r\n\r\n    <p>Mutual fund experts said that a majority of foreign fund houses that were unable to comprehend Indian dynamics. Also, stringent guidelines by Indian regulator, the Securities and Exchange Board of India is also making it tougher for asset managers to charge high fees. A few years ago it banned entry loads, preventing funds from charging a fee to investors buying into schemes.</p>', 2, 0),
(6, 'A Vintner\'s Quest to create a truly American Wine', 'Business and Tech', 'a_vintners_quest_to_create_truly_american_wine', '180521_r32096web.jpg', 'Randall Grahm’s iconoclastic obsession will involve breeding new varietals from scratch and growing them where grapes have never been grown before.', '2018-05-30 00:00:00', 'By Adam Gopnik', '<p>Many students have been driven to drink by the effort of understanding Martin Heidegger’s “Being and Time.” Only one, perhaps, has been driven to wine, exclusively and for life, and that is the inimitable California vintner, punster, screw-top evangelist, and all-around Don Quixote of the vineyards, Randall Grahm. In the nineteen-seventies, when he was a philosophy major at the University of California at Santa Cruz, and struggling with a senior thesis on the concept of Dasein, the most obscure idea in Heidegger’s obscure classic, he happened to wander into a wine store in Beverly Hills called the Wine Merchant. It was a time when the great crus of France were relatively cheap, and the owner, Dennis Overstreet, soon to be his employer, was generous. “There was a kind of Bordeaux scandal at the time, and he had taken some really crappy stuff off the exporters’ hands in exchange for several cases of Musigny,” Grahm explains. As he and Overstreet shared a bottle of the 1971 Comte Georges de Vogüé Musigny, Vieilles Vignes, the mystery of Dasein was replaced by the mystery of Musigny: how, Grahm wondered, had something so haunting and complicated been produced by growing grapes, juicing them, and then letting them grow old in bottles?</p>\r\n\r\n<p>Within a short time, Grahm had enrolled at the University of California at Davis, the M.I.T. of American fermentation, where winemaking had become an object of academic research. There, he began an obsession with creating an American wine that has some of the qualities of great red Burgundy—or even those of the great wines of France’s Rhône Valley. As he points out, several figures in the making of California wine culture were also renegade philosophy students, including Paul Draper, the recently retired head winemaker of Ridge Vineyards and one of the few whom Grahm unstintingly admires. He offers a simple reason for the connection between philosophers and wine: “Wine is a mystery that holds the promise of an explanation.”</p>\r\n\r\n<p>His improbable quest has led him to become a pioneer of Rhône Valley varietals in Northern California; an apostle of the screw cap as the one right “closer” for good wine; and, for a while, a very successful beverage businessman (at one point, largely on the strength of his popular wine Big House, he was selling four hundred and fifty thousand cases a year). Next came a semi-orderly downsizing of his wine label, Bonny Doon, prompted by fears of its being corrupted by too much commercialism. Most recently, he has decided to take possession of four hundred acres of land near the little mission town of San Juan Bautista—it’s the place where Hitchcock’s “Vertigo” reaches its climax, though the tower from which Kim Novak falls was added to the mission by the film’s art-department team. Thirty or so miles from Santa Cruz, on a hillside where nothing but grass and weeds has ever grown, Grahm is going to try to make an American wine that is an entirely original expression of its terroir, of the land on which it’s raised and the place from which it came.</p>\r\n\r\n<p>The effort at the new vineyard, called Popelouchum, involves a three-pronged assault. First, Grahm intends to plant and test a series of uncelebrated grapes that have languished in the shadows of European viticulture. Next, he will “auto-tune” some familiar European grapes by breeding them incestuously and then testing for slight improvements in each successive generation. Finally, he hopes to produce an entirely new American varietal by growing and crossing unlikely pairs of grapes from seed—which is a bit like an ambitious Yankees general manager trying to raise starting shortstops from embryos. “There may not be one great American grape,” Grahm says, philosophically. “It may be the intermingling of a thousand grapes that becomes the great grape.”</p>\r\n\r\n<p>The Don Quixote comparison is self-imposed—Grahm once wrote a ten-thousand-word poem with himself in the role of a character called Don Quijones—and so, given the scale of this year’s windmills, any small sign of reassurance raises his spirits. “I had a geomancer out to Popelouchum,” he recalled not long ago, from the driver’s seat of his 1972 Citroën, “and he said that we must orient the entrance of the site in only one direction.” Geomancy is an ancient means of divination involving throwing soil and rocks and interpreting their omens; Grahm, in the Northern California way, is an agreeable mixture of tough-minded agricultural science and what he calls “Santa Cruz woo-woo.” He went on, “So, the geomancer goes like this, definitively: ‘Northwest! That’s the way in which prosperity lies!’ I’m sure that he had no idea that he was pointing directly at Cupertino!” Cupertino is the site of Apple’s headquarters, just around the bend.</p>\r\n\r\n<p>“And then we had the Bourguignons out to the vineyard!” Claude and Lydia Bourguignon are a legendary and aptly named French surveying couple who evaluate sites for wine growing. “They identified five distinct terroirs within the property,” Grahm said. “And the really exciting thing is the extravagance of limestone—there’s limestone everywhere.” Limestone, he explained, is typical of the greatest vineyards, which tend to be stony rather than loamy, stress making finer grapes. “Rocks are always good, but I think it’s the porousness of limestone that explains its power,” he added. “It breathes. Of course, on the other side, there are so many forbidding negatives! There’s the fault line—we’re right on the San Andreas fault line. No one knows just how that will change things. And there’s the rats! We have these giant mutant vineyard rats that basically ate the entire first crop. We can’t poison them, of course.” The new vineyard is meant to be not only organic, without pesticides of any sort, but also “dry farmed,” without irrigation. “So I’m renting some Jack Russell terriers who are demon ratters.”\r\n</p>', 46, 0),
(7, 'Michel Platini: 1998 World Cup draw \'trickery\' influenced draw', 'Sports', 'michel_platini_1998_world_cup_draw_trickery_influenced_draw', 'i.jpeg', 'Platini was a co-organiser of the 1998 tournament along with late French Football Federation president Fernand Sastre.', '2018-05-30 00:00:00', 'By Ian Holyman', '<p>Michel Platini has admitted he \"did a little trickery\" with the 1998 World Cup group stage draw to try and ensure hosts France and reigning champions Brazil would fulfil \"everyone\'s dream\" by meeting in the final.</p>\r\n\r\n		<p>Platini was a co-organiser of the 1998 tournament along with late French Football Federation president Fernand Sastre.</p>\r\n\r\n		<p>The former UEFA President told France Bleu he had had a hand in ensuring France and Brazil would not meet before the final if both qualified top of their sections in the group stage, which they eventually did.</p>\r\n\r\n		<p>\"That was everyone\'s dream,\" said Platini, who is currently serving a four-year ban from all football actitivies. \"We did a little trickery. You have to organise the fixture list. So, we did it so that if France and Brazil were first, they wouldn\'t meet before the final. We were at home so we took advantage of things.</p>\r\n\r\n		<p>\"We didn\'t bust our balls organising a World Cup for six years to not be able to do a little trickery. You don\'t think the others didn\'t do that at other World Cups? Really?\"</p>\r\n\r\n		<p>In line with the pre-published draw protocol, Brazil, as holders, were placed in Group A and finished top despite losing their final group game to Norway having already beaten Scotland and Morocco.</p>\r\n\r\n		<p>France knew they would be in Group C before the group-stage draw was made, and won all three matches against Denmark, South Africa and Saudi Arabia.</p>\r\n\r\n		<p>Both teams progressed to the final where France won 3-0, notably thanks to two headed goals from Zinedine Zidane.</p>\r\n\r\n		<p>\"It wasn\'t difficult: France in Group A [sic], Brazil in Group F [sic], whatever, I don\'t know. If they both finished top, they couldn\'t meet before the final,\" Platini said. \"That\'s all, it\'s simple.\"</p>\r\n\r\n		<p>L\'Equipe reported that Platini and Sastre had wanted to go further, citing Platini as saying: \"We wanted geographical choices, that Italy play in the south, Spain in Toulouse or Bordeaux, the Netherlands in Lens. They didn\'t listen to us.\"</p>\r\n\r\n		<p>\"It\'s the first time the seeds won\'t be pre-placed [in groups],\" Sastre had complained in 1997. Then-FIFA president Joao Havelange did, however, agree to allow Platini and Sastre to place Brazil and France in the groups they desired.</p>\r\n\r\n		<p>The sports daily also stated the major teams at the 1994 World Cup, namely Germany, Brazil and Italy, as well as the hosts, the USA, had negotiated with organisers to be able to choose the cities in which they would play their group stage games. Italy, for example, played all three group games on the East Coast where there is a large Italian-American population.</p>\r\n\r\n		<p>In 1990, the seeds were put into groups via an automatic system based on their results in previous World Cups, while in 2006, hosts Germany were in Group A, champions Brazil in Group F, meaning they could not face each other until the final.</p>\r\n\r\n		<p>Since, only the hosts have be predrawn in which group they will play.</p>\r\n', 9, 0),
(8, 'A Giant bids Farewell to Barca', 'Sports', 'a_giant_bids_farewell_to_barca', '4C7B6FA400000578-5751257-image-a-9_1526887076730.jpg', '\'I just want to say that my heart will be here for ever\': Tearful Andres Iniesta takes to the 99,000-seat Nou Camp pitch alone to reflect on 22-year career after emotional Barcelona farewell vs Real Sociedad.', '2018-05-26 00:00:00', 'By Pete Jenson', '<p>As the Nou Camp emptied and players and staff alike departed for the evening, one solitary figure was left sitting alone on the hallowed turf – surrounded only by 99,000 empty seats.</p>\r\n\r\n<p>Andres Iniesta, calling time on his Barcelona career after 22-years of service, took to the centre circle for one final moment of reflection within the surroundings of the coliseum he knows so well.</p>\r\n\r\n<p>Earlier, the stadium DJ, who had spent ten minutes following the final whistle drowning out the Barcelona supporters, finally fell silent and the microphone was at last passed to the man of a million passes.</p>\r\n\r\n<p>Iniesta was in tears as a video of his greatest moments played on various screens around the Camp Nou stadium he has graced for 15 seasons. </p>\r\n\r\n<p>\'These have been 22 unbelievable years and it has been an honour to defend this club – for me the best club in the world,\' he said.\r\n\r\n\'I want to thank every one of my team-mates and all of you in the stadium. I\'m leaving aged 34 years and I just want to say that my heart will be here for ever.\'\r\n\r\nHis team-mates promptly gave him the bumps out on the edge of the centre circle as around 90,000 inside the Nou Camp belted his name out one more time.\r\n\r\nIniesta\'s last coach Ernesto Valverde said: \'I will be able to say in the future that I was the Barcelona manager for the game that he left the club. He is someone who will never be repeated.\r\n\r\n\'I think it was an emotional night for everyone. He is a legend here. He is the standard bearer.\'</p>\r\n\r\n<p>Iniesta carried the Spanish league title around the stadium as the Barcelona players celebrated with their families on the pitch.\r\n\r\nHe had been joined by members of his family who had watched his final game alongside former Barcelona midfielder Xavi Hernandez.\r\n\r\nXavi had published an open letter in the build up to the game in which he said: \'I still remember the first time I saw Andres play.\r\n\r\n\'I was in the youth team and he was in the underage group and somebody in the club told me: \"Xavi, there\'s a boy down there who\'s going to be the best\".</p>', 7, 1),
(11, 'Zinedine Zidane quits as Real Madrid manager after third Champions League crown', 'Sports', 'zinedine_zidane_quits_as_rma_manager_after_third_champions_league_crown', 'skysports-zidane-zinedine-zidane_4324679.jpg', 'Zinedine Zidane has quit as Real Madrid manager just days after becoming the first coach to win the Champions League in three consecutive seasons.', '2018-05-31 00:00:00', 'By James Dale', '<p>Zidane, 45, replaced Rafael Benitez in January 2016 and despite his European success has come under pressure for winning only one La Liga title during his two and a half years in charge.</p>\r\n\r\n<p>He told Real president Florentino Perez he would be leaving on Wednesday before informing the players.</p>\r\n\r\n<p>\"I know it is a strange moment for everyone involved,\" said Zidane. \"But it had to be done for everybody.</p>\r\n\r\n<p>\"This team has to continue winning and need a change. After three years they need a new voice, a new way of saying things - possibly another way of working.</p>\r\n\r\n<p>\"That\'s why I\'ve taken that decision. I love this club, I love the president, he\'s given me the chance to come as a player and a manager. I\'m eternally grateful to him but today for me and for everyone we have to change.\"</p>\r\n\r\n<p>Perez admitted Zidane\'s decision was completely unexpected after the club\'s 13th Champions League title last weekend.</p>\r\n\r\n<p>\"It is a sad day for me and will be for the fans, the players and everyone at the club,\" said Perez. \"I wanted him to be next to me forever. But I know it is his final decision.</p>\r\n\r\n<p>\"I would have liked to convince him to stay on but I know what he is like.\"</p>\r\n\r\n<p>In January this year, Zidane confirmed he signed a contract extension at Real to keep him at the club until 2020 but said \"it does not mean anything\".</p>\r\n\r\n<p>A month later, Zidane said: \"Being a coach is extremely tiring - more so at a club like Real Madrid, When I feel there is nothing more to give, I\'ll walk away\".</p>\r\n\r\n<p>Gareth Bale, who scored twice in Real\'s 3-1 win over Liverpool in Saturday\' Champions League final, and Cristiano Ronaldo have both cast doubts on their future at the Bernabeu since lifting the trophy.</p>', 5, 0),
(12, 'Google I/O Keynote 2018: Summary', 'Business and Tech', 'google_io_keynote_2018_summary', 'google-io-2018.png\r\n', '“Make good things together.”', '2018-06-25 00:00:00', 'By Meg Prater', '<p>The 12 Biggest Announcements from Google I/O 2018</p>\r\n<p>1. Updates to Gmail\r\nMany of us have already experienced subtle changes to our Gmail inboxes over the past few weeks, but there’s more to come. This flagship product is being redesigned with artificial intelligence (AI), giving consumers tools like Smart Compose, which uses machine learning to suggest phrases in real time as you’re composing email messages.</p>\r\n\r\n<p>Type a subject line about Taco Tuesday? Smart Compose will suggest body text like, “How about we meet for tacos,” and “Does next Tuesday work for you?” These updates will roll out to consumers over the next few weeks, with G Suite users waiting a few months.</p>\r\n\r\n<p>2. A more conversational Google Assistant\r\nNoted as “The biggest thing we’re tackling with AI,” Google Assistant is getting a voice-lift, so to speak. The system’s current voice, Holly, will be joined by six new voices (available today), each of which is more conversational.</p>\r\n\r\n<p>Google used WaveNet technology to underline raw audio, allowing its voices to understand the human voice, syntax, and natural pauses to develop an assistant that’s more natural and comfortable to speak with. Oh, and John Legend’s voice will be available later this year … ?</p>\r\n\r\n<p>3. Hey Google, what’s Multiple Actions?\r\nIf you’re tired of saying, “Hey Google” before each request you make, you’re in luck. Multiple Actions allows Google Assistant users to ask multiple questions at once. For example, you could say, “Hey Google, who was the governor of California when Kevin Durant was drafted and what team drafted him?” and Google would answer both of your questions without flinching.</p>\r\n\r\n<p>4. Smart Home\r\nVoice search paired with a visual experience was a big theme for Smart Home this I/O. When you pull up a recipe, for example, you’ll be greeted by text directions for the recipe and a video that audibly walks you through each step. Simple voice searches such as, “Who is Camilla Cabello” will also now turn up visual as well as audio results, giving users a more immersive experience Android devices this summer and iOS later this year.</p>\r\n\r\n<p>5. Kiss phone calls goodbye\r\nThe wishes of collective America have come true and we’re one step closer to never having to call another human being on the phone gain. Need to make an appointment for a haircut on Tuesday morning between 10:00 a.m. and 12:00 p.m.? Google Assistant will take that information and actually make the call for you, schedule it, and share the details.</p>\r\n\r\n<p>It even works if calls don’t go as expected. During one live demo, a Google Assistant called to make a reservation for four at a restaurant that required five or more for a reservation. The assistant uses deep learning to handle these situations “gracefully.” In the case of the dining reservation, the assistant knew to ask how long the wait would be without a reservation.</p>\r\n\r\n<p>6. Android Dashboard\r\nAnother big theme of the I/O keynote was giving users time back as part of a digital well-being initiative. With Android P’s Dashboard, customers can see a user-friendly breakdown of how they’ve spent their day on their device and desktop.</p>\r\n\r\n<p>YouTube will suggest you exit your cat video wormhole and take a break, and you can set an App Timer to limit time spent on apps. Once you’ve reached your limit, Google will grey out the app and suggest you exit. The idea is this will encourage users to put their phones down and actually interact with the world around them -- because it’s come to that, folks. We actually need our devices to tell us when to put them down.</p>\r\n\r\n<p>An updated Do Not Disturb mode will also silence your phone when you put it face down, and Wind Down Mode allows you to tell your assistant when you’d like to go to bed, at which point, your phone will turn to grayscale, which helps your brain wind down. Android P Beta is now available on seven flagship devices.</p>\r\n\r\n<p>7. Full Coverage\r\nPerhaps the strongest “stance” taken during this year’s keynote was that of all people having access to “the full story.” Google News’ Full Coverage feature gives readers a complete look at how a single story is being covered on a variety of news outlets -- all in real time. To combat fake news or “tunnel vision,” everyone using this feature will see the same news at the same time, thereby giving us all the information we need to engage in a responsible and lively debate. Here’s hoping, Google.</p>\r\n\r\n<p>8. Smart batteries\r\nAndroid P also offers “adaptive battery” which uses on-device machine learning to discover which apps you’ll use now, later, and probably not today. Then, it spends precious battery life fueling only the apps you use giving you a longer battery life.</p>\r\n\r\n<p>9. Google knows you don’t know which way South is\r\nWe’ve all been there. You pull up Maps, enter your directions, watch the arrow populate, and walk in a random direction until you figure out which way you should actually be going. No more! Maps now combines your camera, street view, and directions to provide augmented reality walking directions. Plus, they’re playing with fun avatars that may soon be bounding out in front of you and showing you the way themselves.</p>\r\n\r\n<p>10. Watch out, Yelp\r\nNow, everytime you rate a restaurant or shop on Google, Google will use that information, in conjunction with its own knowledge of your surrounding area to give local haunts a score based entirely on your preferences. So, if you’ve rated two nearby Ethiopian restaurants highly and given two Pho restaurants and a burger joint pretty low marks, Google might give that new Eritrean restaurant a high match score for you.</p>\r\n\r\n<p>11. Google Lens knows what everything is\r\nThe new Lens is integrated with your camera and allows you to point your phone at virtually anything to find out what it is or where you can buy similar items. Want to know what that building to your right is? Point your lens at it and Google will tell you. Like that outfit in the window? Lens will break down each piece and tell you where you can find it. Just like the general style of that lamp? Style Match will surface results that are different from the original but still in a similar style.</p>\r\n\r\n<p>12. Self-driving cars are not going away\r\nProving you can’t keep an autonomous vehicle down, Waymo CEO John Krafcik ignored last Friday’s crash involving a car that hit a Waymo van and focused on the future. Much of the time was spent discussing measures to increase pedestrian safety, a common concern after one of Uber’s self-driving cars killed a Phoenix pedestrian in March of 2018.</p>\r\n\r\n<p>Pedestrian safety is something Waymo claims they’ve increased by 100x, demonstrating their cars’ ability to identify pedestrians in blow-up dinosaur costumes, partially hidden behind planks of wood, and poking out of manhole covers. They also showed a Waymo van avoiding a collision with a car running a red light -- something that might have come in handy during last week’s crash. Waymo also announced plans to launch its self-driving car service to all Phoenix consumers later this year.</p>', 10, 0);
INSERT INTO `posts` (`id`, `title`, `category`, `slug`, `image`, `info`, `date`, `author`, `body`, `views`, `featured`) VALUES
(13, 'The Grand Master', 'Sports', 'the_grand_master', '4CE95B0500000578-5821663-The_great_midfielder_admits_saying_goodbye_to_La_Liga_giants_Bar-a-87_1528468833985.jpg', ' Andres Iniesta on his 35 trophies at Barcelona, a World Cup swansong and his love of former Man United boss Sir Alex Ferguson', '2018-06-09 00:00:00', 'By Pete Jenson', '<p>Can England and Spain meet in the final? asks Andres Iniesta as he gets to his feet at the end of the interview.\r\n\r\nWe’ve got high hopes, Andres, but maybe not quite that high.\r\n\r\nSpain’s greatest ever player is laughing now, stood before a wall covered in photographs of retired internationals. He will join the hall of fame soon, once he’s played his fourth World Cup finals.</p>\r\n\r\n<p>And yes, if Gareth Southgate’s team and Spain top their groups, they could meet in the final.\r\n\r\nEngland making it to Moscow on July 15 would be an incredible achievement. Spain being there would mean a glorious goodbye for one of the game’s grand masters.</p>\r\n\r\n<p>That is certainly the farewell he has in mind. He’s had enough of the tributes that have marked his last season after 22 years at Barcelona, winning 35 major honours. ‘It has been emotional,’ he says. ‘But now to the football and one last challenge.’\r\n\r\nAt times his departure from Barcelona has overwhelmed him. He cried on the substitutes’ bench after being applauded off towards the end of the Spanish Cup final.\r\n\r\nAnd he sat alone in an empty Nou Camp at the end of his last league game. ‘I’ve played my whole life in Barcelona and saying goodbye isn’t easy. You never really expect so much affection.</p>\r\n\r\n<p>‘I sat out on the grass alone after my final game, it was an intimate moment between me and that pitch where I had played so many matches. It was me saying goodbye to my home. Every corner of the Nou Camp has a memory for me. The tunnel, the showers, the lockers, everything. It’s brutal.’</p>\r\n\r\n<p>In Russia there will be no more tributes, no more adulation. Cristiano Ronaldo, no less, will be waiting for him in Spain’s first game in Sochi on Friday. Iniesta is magnanimous about the Real Madrid player who he once famously shushed in a fiery Clasico but who he said deserves every one of his five Ballons d’Or.\r\n\r\nOf an era in which his own exploits have not been enough to win a Ballon d’Or because of Lionel Messi’s duel with Ronaldo, Iniesta says: ‘I don’t know if we will ever see anything like this again.\r\n\r\n‘It has been an incredible era, and everything I have had around me, both on my side and against me, has made me a better player. I’ve made the most of it. We’ve all made each other better.’</p>', 3, 0),
(24, '“Ant-Man and the Wasp” Should Have Been the “Godfather: Part II” of Superhero Movies', 'Business and Tech', 'Ant-Man-and-the-Wasp-Should-Have-Been-the-Godfather-Part-II-of-Superhero-Movies', 'Brody-AntManandtheWasp1.jpg', 'Ant-Man and the Wasp,” starring Paul Rudd, stays closely tethered to the Marvel series with methodical plot steps that feel like mandatory routines rather than freestyle inventions.', '2018-07-07 14:16:34', 'By Richard Brody', '<p>The original “Ant-Man,” from 2015, was a giddy delight, thanks to the inspired direction of Peyton Reed. Its domestic box-office take wasn’t much more than its budget, but international audiences turned it into a hit, giving it more than a half-billion dollars in ticket sales. That\'s why I had high hopes for “Ant-Man and the Wasp,” which, like the earlier film, is directed by Reed; I suspected that, on the basis of the first film\'s commercial success, this installment might be, in effect, the “Godfather: Part II” of superhero movies—a sequel made with even greater directorial freedom and audacity than the original.</p>\r\n\r\n<p>\r\nNo such luck. “Ant-Man and the Wasp” draws its premise and its range of action from another movie in the Marvel domain—“Captain America: Civil War,” in which Scott Lang, a.k.a. Ant-Man (Paul Rudd), makes a brief, astonishing appearance—and, unlike the earlier film, the sequel is closely tethered to the Marvel series in an array of methodical plot steps that feel like mandatory routines rather than freestyle inventions.</p>\r\n\r\n<p>Owing to a suit created by the super-scientist Hank Pym (Michael Douglas), Ant-Man can shrink instantly to the size of a bug and beyond, to the atomic scale. In “Captain America: Civil War,” in which he displays the additional power to expand to colossal size , Ant-Man went rogue with rebel superheroes (led by Steve Rogers) and was arrested. “Ant-Man and the Wasp” begins about two years after the end of “Captain America: Civil War”: Scott is three days away from the end of his sentence of house arrest. He lives in the San Francisco area and runs a modest home-security business with his former partners in crime, and his paternal devotion to his young daughter, Cassie (Abby Ryder Fortson), provides a motive for him to live an ordinary life without superheroes after his sentence is up.</p>\r\n\r\n<p>But, just when Scott thought he was out, they pull him back in: Hank and his daughter, Hope van Dyne (Evangeline Lilly)—who also wears a shrinking suit and works as the Wasp—effect some transformational wonders to bring him to their laboratory while leaving behind the ankle monitor he wears as part of his house arrest. They need him for a rescue mission: thirty years earlier, Hank and his wife, Janet van Dyne (Michelle Pfeiffer), also the Wasp, shrank to subatomic size for a battle, but Janet got stuck in the subatomic realm and hasn’t been back. Since Ant-Man, in the earlier film, proved able to both enter the “quantum realm” and exit it safely, they need him for a mission to bring Janet back.</p>\r\n\r\n<p>Reed, in his earlier films (and even in “Ant-Man”) revels in his control of time as well as of space: he gives his actors a framework, and an actual onscreen frame, within which to work, and to work out the dimensions of the action and of their role. He’s the creator of one of the most ingenious long takes in recent years—it’s the dénouement of “Down with Love,” which is the springboard for a tour de force by Renée Zellweger. “Ant-Man and the Wasp,” with Pfeiffer, Douglas, Lilly, Rudd, Fishburne, John-Kamen, Peña, Park, and many other excellent actors, ought to be a similar feast of performance. Instead, it’s a lesson in how little great actors need to be permitted to do in order to radiate the allure of star power—and in the difference between a movie that capitalizes on its actors and one that engages with their inspirations.</p>', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answer` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(3, 'ritom', 'ritomsonowal@gmail.com', '096db72afa3068794b01d38b88e6e74f', 'admin'),
(4, 'pussinboots', 'noone@gmail.com', 'f30aa7a662c728b7407c54ae6bfd27d1', 'subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `vote_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `poll_column` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `forumposts`
--
ALTER TABLE `forumposts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `forumthread`
--
ALTER TABLE `forumthread`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`vote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forumposts`
--
ALTER TABLE `forumposts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `forumthread`
--
ALTER TABLE `forumthread`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-07-16 15:07:02', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
