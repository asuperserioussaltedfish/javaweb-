
// listening to searches
document.getElementById("search-input").addEventListener("input", processSearch);

var characterList = [];
// 用于存取已选的也就是select角色
var selectedCharacters = [];

var historySelect = [];

// 判断请求json文件是否成立
function getJsonObject(url, successHandler, errorHandler) {
  var xhr = typeof XMLHttpRequest != 'undefined'
    ? new XMLHttpRequest()
    : new ActiveXObject('Microsoft.XMLHTTP');
  xhr.open('get', url, true);
  xhr.responseType = 'json';
  xhr.onreadystatechange = function () {
    var status;
    var data;
    if (xhr.readyState == 4) {
      status = xhr.status;
      if (status == 200) {
        successHandler && successHandler(xhr.response);
      } else {
        errorHandler && errorHandler(status);
      }
    }
  };
  xhr.send();
}

// json文件读取后应用json数据渲染页面
window.onload = function () {
  getJsonObject('data.json', function (data) {
    characterList = data.Characters;
    populateTable(characterList);
  });
}

// 渲染数据生成表格
function populateTable(characters) {
  var tableBody = document.getElementById('character-table').getElementsByTagName('tbody')[0];
  // 清空表格
  tableBody.innerHTML = '';
  characters.forEach((character, index) => {
    // 创建行和列
    var row = document.createElement('tr');
    var cell = document.createElement('td');
    cell.textContent = character.name;
    row.appendChild(cell);
    // 添加其他属性列
    ['strength', 'speed', 'skill', 'fear_factor', 'power', 'intelligence', 'wealth'].forEach(attr => {
      var cell = document.createElement('td');
      cell.textContent = character[attr];
      row.appendChild(cell);
    });
    // 添加选择列
    var cell = document.createElement('td');
    var input = document.createElement('input');
    input.type = 'checkbox';
    input.id = `checkbox${index}`;
    character.id = `checkbox${index}`;
    input.addEventListener('change', function () {
      if (this.checked) {
        if (selectedCharacters.length < 2) {
          selectedCharacters.push(character);
          // 这是当选择两个角色后图片改变
          changeImages(selectedCharacters);
          // 这是两个对比的历史记录
          if (selectedCharacters.length == 2) {
            // 等于2即开始对比
            compareDataSeltect(selectedCharacters);
            historySelect.push(selectedCharacters);
            // 调用函数来更新历史记录
            populateTableWithHistory(historySelect);
          }
        } else {
          this.checked = false;
        }
      } else {
        // 取消选择时从数组中移除角色并触发图片选择
        if (selectedCharacters.length == 2) {
          let selectedCharactersCopy = [];
          selectedCharactersCopy.push(selectedCharacters[0]);
          changeImages(selectedCharactersCopy);
          // 取消掉对比
          compareDataRemake(selectedCharactersCopy);
        }
        if (selectedCharacters.length == 1) {
          changeImages([]);
          // 取消掉对比
          compareDataRemake([]);
        }
        selectedCharacters = selectedCharacters.filter(c => c.name != character.name);
      }
    });
    cell.appendChild(input);
    row.appendChild(cell);
    tableBody.appendChild(row);
  });
}

// 为搜索框添加事件监听
document.getElementById('search-input').addEventListener('change', function () {
  var searchString = this.value.toLowerCase();
  var filteredCharacters = getFilteredCharacters();
  if (searchString !== '') {
    filteredCharacters = filteredCharacters.filter(character => character.name.toLowerCase().includes(searchString));
  }
  populateTable(filteredCharacters);
});
//处理搜索的函数
function processSearch(event) {
  var searchValue = event.target.value;
  if (searchValue !== '') {
    search(searchValue);
  } else {
    populateTable(characterList); //如果搜索框为空，则显示所有的角色
  }
}

//执行搜索的函数
function search(searchValue) {
  var filteredCharacters = characterList.filter(character => character.name.toLowerCase().includes(searchValue.toLowerCase()));
  populateTable(filteredCharacters);
}

// filter的controler
const filters = {};
document.querySelectorAll('ui-range').forEach(input => {
  input.addEventListener('input', function () {
    const key = input.id;
    const dududj = document.querySelector(`#${input.id}dj`);
    dududj.innerHTML = input.value
    const value = input.value;
    filters[key] = value;
    filterSearch(filters);
  });
});

// 实现的 filter的搜索函数
function filterSearch(filters) {
  var filteredCharacters = characterList.filter(character => {
    // 对于每个角色，检查它是否满足所有过滤条件
    return Object.entries(filters).every(([key, value]) => {
      const [minValue, maxValue] = value.split(',').map(Number);
      return character[key] >= minValue && character[key] <= maxValue;
    });
  });
  // 渲染列表
  populateTable(filteredCharacters);
  console.log(filteredCharacters);
}

// 实现历史记录
function populateTableWithHistory(historySelect) {
  const tableBody = document.querySelector('#historybody');
  tableBody.innerHTML = '';
  for (let index = 0; index < historySelect.length; index++) {
    const element = historySelect[index];
    // 为每一对创建一个表格行，并为其设置唯一的id
    const row = document.createElement('tr');
    row.id = `historyShow-${index}`;
    element.forEach(character => {
      const cell = document.createElement('td');
      cell.textContent = character.name;
      row.appendChild(cell);
    });
    // 为行添加点击事件监听器
    row.addEventListener('click', function () {
      const rowIndex = this.id.split('-')[1]; // 从 id 中提取索引
      const selectedHistory = historySelect[rowIndex]; // 根据索引获取对应的 historySelect 数据
      // 触发函数后更新并将select更改为合适的
      updateSelectBoxes(selectedHistory);
      changeImages(selectedHistory);
      compareDataSeltect(selectedHistory);
    });
    tableBody.appendChild(row);
  }
}

// 实现更改选择框
function updateSelectBoxes(selectedHistory) {
  // 找到所有复选框并将它们设置为未选中
  document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
    checkbox.checked = false;
  });
  selectedHistory.forEach(item => {
    let checkbox = document.querySelector(`#${item.id}`);
    checkbox.checked = true;
  });
}

// 实现图片更改
function changeImages(selectedCharacters) {
  const character_name1 = document.querySelector('.character-name1');
  const character_name2 = document.querySelector('.character-name2');
  const character_image1 = document.querySelector('.character-image1');
  const character_image2 = document.querySelector('.character-image2');
  if (selectedCharacters.length == 2) {
    character_name1.innerHTML = selectedCharacters[0].name;
    character_name2.innerHTML = selectedCharacters[1].name;
    character_image1.src = selectedCharacters[0].image_url;
    character_image2.src = selectedCharacters[1].image_url;
  }
  if (selectedCharacters.length == 1) {
    character_name1.innerHTML = selectedCharacters[0].name;
    character_image1.src = selectedCharacters[0].image_url;
    character_name2.innerHTML = '';
    character_image2.src = 'images/question.jpg';
  }
  if (selectedCharacters.length == 0) {
    character_name1.innerHTML = '';
    character_name2.innerHTML = '';
    character_image1.src = 'images/question.jpg';
    character_image2.src = 'images/question.jpg';
  }
}


// 实现数据横向对比
function compareDataSeltect(selectedCharacters) {
  let count = 0;
  // 属性列表
  let attributes = ["strength", "speed", "skill", "fear_factor", "power", "intelligence", "wealth"];
      // 首先把之前比较的全部删除
      attributes.forEach(attr => {
        const result1 = document.querySelector(`#character1-${attr}-tick`);
        result1.style.display = `none`;
        const result2 = document.querySelector(`#character2-${attr}-tick`);
        result2.style.display = `none`;
      })
  // 遍历所有属性进行比较
  attributes.forEach(attr => {
    // 比较两个角色的属性值
    if (selectedCharacters[0][attr] >= selectedCharacters[1][attr]) {
      // 左边
      const result = document.querySelector(`#character1-${attr}-tick`);
      result.style.display = 'inline-block';
      count++;
    } else {
      // 右边
      const result = document.querySelector(`#character2-${attr}-tick`);
      result.style.display = 'inline-block';
      count--;
    }
    // 控制背景颜色
    if (count > 0) {
      const character1_flags = document.querySelector('#character1-flags');
      character1_flags.style.background = '#00550C';
      const character2_flags = document.querySelector('#character2-flags');
      character2_flags.style.background = '#540000';
    } else {
      const character1_flags = document.querySelector('#character1-flags');
      character1_flags.style.background = '#540000';
      const character2_flags = document.querySelector('#character2-flags');
      character2_flags.style.background = '#00550C';
    }
  });
}

// 当取消数据对比时底部回原样
function compareDataRemake(selectedCharacters) {
  if (selectedCharacters.length == 0) {
    let attributes = ["strength", "speed", "skill", "fear_factor", "power", "intelligence", "wealth"];
    // 控制背景颜色返回原色
    const character1_flags = document.querySelector('#character1-flags');
    character1_flags.style.background = '#1f1f1f';
    const character2_flags = document.querySelector('#character2-flags');
    character2_flags.style.background = '#1f1f1f';
    attributes.forEach(attr => {
      const result1 = document.querySelector(`#character1-${attr}-tick`);
      result1.style.display = `none`;
      const result2 = document.querySelector(`#character2-${attr}-tick`);
      result2.style.display = `none`;
    })
  } else {
    let attributes = ["strength", "speed", "skill", "fear_factor", "power", "intelligence", "wealth"];
    // 然后赋值
    attributes.forEach(attr => {
      if (selectedCharacters[0][attr]) {
        const result1 = document.querySelector(`#character1-${attr}-tick`);
        result1.style.display = `inline-block`;
        const character1_flags = document.querySelector('#character1-flags');
        character1_flags.style.background = '#00550C';
        const character2_flags = document.querySelector('#character2-flags');
        character2_flags.style.background = '#1f1f1f';
        const result2 = document.querySelector(`#character2-${attr}-tick`);
        result2.style.display = `none`;
      }
    })
  }
}