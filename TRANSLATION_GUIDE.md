# TRIZ 教程中文翻译指南

## 翻译原则

### 1. 整体风格
- 使用简体中文
- 学术性与可读性并重
- 保持专业术语的准确性
- 语言流畅自然，符合中文表达习惯

### 2. 术语翻译对照表

#### TRIZ 核心术语
- TRIZ → TRIZ（保持不变，可注明"发明问题解决理论"）
- Creative Problem Solving → 创造性问题解决
- Contradiction → 矛盾
- Technical Contradiction → 技术矛盾
- Physical Contradiction → 物理矛盾
- Ideal Final Result (IFR) → 理想最终结果
- Resources → 资源
- 40 Principles → 40个发明原理
- Contradiction Matrix → 矛盾矩阵
- Laws of Evolution → 演化定律
- Function Analysis → 功能分析

#### 创造力术语
- Flow → 心流
- Play → 游戏/玩耍
- Creativity → 创造力
- Innovation → 创新
- Problem Solving → 问题解决
- Lateral Thinking → 横向思维
- Parallel Thinking → 平行思维
- Metaphoric Thinking → 隐喻思维

#### 心理学术语
- Domain → 领域
- Field → 场域
- Self → 自我
- Cultural Capital → 文化资本
- MBTI → MBTI人格类型
- Big Five → 大五人格

### 3. 翻译规范

#### Markdown 格式
- 保持所有 Markdown 标记不变
- 保持代码块不变（包括 R 代码）
- 保持 YAML frontmatter 结构
- 翻译 title, tags 等字段
- 保持图片路径不变

#### 专有名词
- 人名：首译后括注原文，如"米哈里·契克森米哈赖 (Mihaly Csikszentmihalyi)"
- 组织名：可翻译但保留英文缩写
- 书名：翻译后括注英文原名
- 网站/链接：保持 URL 不变，翻译链接文字

#### 代码和注释
- R 代码不翻译
- 代码中的字符串如需翻译，添加中文注释
- 代码注释可翻译为中文

#### 数字和单位
- 保持数字格式不变
- 单位可翻译（如 pages → 页）

### 4. 质量检查清单

- [ ] 术语翻译一致性
- [ ] 语言流畅自然
- [ ] 无漏译
- [ ] Markdown 格式正确
- [ ] 代码块完整
- [ ] 图片链接正常
- [ ] YAML frontmatter 正确

### 5. 翻译优先级

**高优先级**（核心内容）：
1. TRIZ 核心模块
2. 基础创意模块
3. 主页和导航

**中优先级**（辅助内容）：
4. 案例研究
5. 作业和游戏

**低优先级**（可选）：
6. 参考资料
7. 演讲稿

## 文件组织结构

```
content/
├── Basics/Modules/     # 基础模块
│   ├── 10-Flow-and-Play/index.qmd
│   ├── 20-Cultural-Capital/index.qmd
│   └── ...
├── TRIZ/Modules/       # TRIZ 核心模块
│   ├── 60-Problems-and-Contradictions/index.qmd
│   └── ...
└── projects/Modules/   # 案例研究
    └── ...
```

每个文件翻译后：
1. 保持原文件名不变
2. 替换文件内容为中文版本
3. 原英文内容已备份到 git 历史
