<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <title>Cartoonopia - Compare Cartoon Characters</title>
   <link rel="stylesheet" href="index.css" />
   <script src="sliderControler.js"></script>
</head>

<body>
   <div class="all">
      <header>
         <h1>Cartoonopia</h1>
         <p>The home of characters and cartoons!</p>
      </header>
      <div class="main">
         <div class="search-container">
            <div class="filters-container">
               <h2>Filters</h2>
               <!-- 过滤器代码 -->
               <div class="filter">
                  <label for="strength">Strength</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="strength" name="strength"></ui-range>&nbsp;
                  <div id="strengthdj">0,100</div>
               </div>
               <div class="filter">
                  <label for="speed">Speed</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="speed" name="speed"></ui-range>&nbsp;
                  <div id="speeddj">0,100</div>
               </div>
               <div class="filter">
                  <label for="skill">Skill</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="skill" name="skill"></ui-range>&nbsp;
                  <div id="skilldj">0,100</div>
               </div>
               <div class="filter">
                  <label for="fear">Fear Factor</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="fear_factor"
                     name="fear_factor"></ui-range>&nbsp;
                  <div id="fear_factordj">0,100</div>
               </div>
               <div class="filter">
                  <label for="power">Power</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="power" name="power"></ui-range>&nbsp;
                  <div id="powerdj">0,100</div>
               </div>
               <div class="filter">
                  <label for="intelligence">Intelligence</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="intelligence"
                     name="intelligence"></ui-range>&nbsp;
                  <div id="intelligencedj">0,100</div>
               </div>
               <div class="filter">
                  <label for="wealth">Wealth</label>
                  <ui-range min="0" max="100" value="0, 100" multiple id="wealth" name="wealth"></ui-range>&nbsp;
                  <div id="wealthdj">0,100</div>
               </div>
            </div>

         </div>
         <div class="character-comparison">
            <div class="search-table">
               <form id="search-form">
                  <input id="search-input" type="text" placeholder="Search for a character">
               </form>
            </div>
            <table id="character-table">
               <thead>
                  <tr>
                     <th>Name</th>
                     <th>Strength</th>
                     <th>Speed</th>
                     <th>Skill</th>
                     <th>Fear Factor</th>
                     <th>Power</th>
                     <th>Intelligence</th>
                     <th>Wealth</th>
                     <th>Select</th>
                  </tr>
               </thead>
               <tbody>
               </tbody>
            </table>
         </div>
         <div class="history-container">
            <h2>Previous Comparisons</h2>
            <table id="history-table">
               <thead>

               </thead>
               <tbody id="historybody">
                  <!-- 动态插入history -->
               </tbody>

            </table>
         </div>
      </div>
      <!-- Character vs character comparison section -->
      <div class="character-vs-character">
         <!-- Character 1 container -->
         <div class="character-container character-container1">
            <div class="character-name1 character-name"></div>
            <img src="images/question.jpg" alt="Batman" class="character-image1 character-image" />
         </div>

         <!-- VS sign -->
         <div class="vs-sign">
            <span>VS</span>
         </div>

         <!-- Character 2 image -->
         <div class="character-container character-container2">
            <div class="character-name2 character-name"></div>
            <img src="images/question.jpg" alt="Mickey Mouse" class="character-image2 character-image" />
         </div>
      </div>
      <div class="wrapperAll">
         <div class="wrapper">
            <div class="flag" id="character1-flags">
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-strength-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-speed-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-skill-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-fear_factor-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-power-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-intelligence-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character1-wealth-tick"></span>
            </div>
            <div class="comparison-results">
               <div class="result">Strength</div>
               <div class="result">Speed</div>
               <div class="result">Skill</div>
               <div class="result">Fear</div>
               <div class="result">Power</div>
               <div class="result">Intelligence</div>
               <div class="result">wealth</div>
            </div>
            <div class="flag" id="character2-flags">
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-strength-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-speed-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-skill-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-fear_factor-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-power-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-intelligence-tick"></span>
               <span class="tick-mark"><img src="images/bingo.jpg" alt="✓" class="bingo"
                     id="character2-wealth-tick"></span>
            </div>
         </div>
      </div>

      <footer>
      </footer>
   </div>

   <script src="index.js"></script>

</body>

</html>