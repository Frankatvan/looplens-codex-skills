# LoopLens Codex Skills

[![Validate Skills](https://github.com/Frankatvan/looplens-codex-skills/actions/workflows/validate.yml/badge.svg)](https://github.com/Frankatvan/looplens-codex-skills/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Codex Skills](https://img.shields.io/badge/Codex-Skills-111827.svg)](skills)
[![Workflow](https://img.shields.io/badge/workflow-考古%20%2B%20审计%20%2B%20漂移评估-blue.svg)](#推荐工作流)
[![Languages](https://img.shields.io/badge/docs-English%20%7C%20中文-orange.svg)](README.md)

[English](README.md) | **中文**

LoopLens Codex Skills，中文名 **闭环镜 Skill 套件**，是一组三段式 Codex Skill，用来理解已实现系统、审计已实现的数据闭环设计，并评估新需求是否会污染已有闭环。

核心思路很简单：

1. 先只记录系统现在真实做了什么。
2. 再审计已实现系统是否符合闭环原则。
3. 最后才把新需求放到已审计的基线之上，判断它会保留、修复还是污染闭环。

这三个动作必须分开。否则，考古报告容易混入未来需求，需求评审容易虚构已实现能力，迁移计划也可能在系统事实还没看清前就提前出现。

## 读者友好输出

LoopLens 的报告会保留明细，因为后续代理和工程师需要证据表、数据血缘、评分表和漂移台账。但每份完整报告也必须在顶部附近提供本地化的 `Reader Summary`，最终 Codex 聊天回复也必须使用用户语言给出摘要。

摘要层面向快速判断：

- 一句话结论或决策
- 最强的已验证事实或闭环发现
- 影响最大的风险、漂移或未知
- 下一步审计、修复门槛或阻断问题
- 报告链接

用户用中文提问，就输出中文摘要；用英文提问，就输出英文摘要；也可以明确指定其他语言。

## 为什么需要 LoopLens

很多 AI 生成的系统分析会把三类工作混在一起：

- 当前态考古：系统现在已经实现了什么。
- 已实现闭环审计：当前链路是否符合数据治理原则。
- 新需求漂移评估：新功能是否会制造第二套事实源或破坏既有闭环。

混在一起后，报告很容易失真：考古报告开始评价未来需求，需求评审开始发明当前能力，系统还没看清就出现实施计划。

LoopLens 通过三份明确的 Codex Skill 把边界切开。

## 三个 Skill

### 1. `legacy-system-archaeology`

第一个使用。

它只基于已实现证据建立当前系统基线，证据包括代码、迁移、测试、脚本、运行快照、日志和已提交配置。

它不会：

- 评价十六字方针
- 编写工作包计划或迁移计划
- 编写修复计划
- 把 PRD 或路线图当作已实现事实

主要输出包括：

- 系统清单
- 入口点和触发器
- 核心流程
- 状态和依赖图
- 风险台账
- 运营对象草图
- 必要时的数据逻辑图
- 身份和移动完整性
- 授权和审批拓扑
- 技术债和未知项

### 2. `implemented-closed-loop-audit`

在考古基线完成后使用。

它审计已实现代码是否符合闭环原则：

`就源输入、多次应用、环环相扣、相互稽核`

它不读取 PRD 或新需求，也不编写修复计划。

主要输出包括：

- 已导入的考古基线
- 源事实台账
- 四原则评分表
- 已实现闭环追踪图
- 重复录入和漂移审计
- 交叉校验和对账审计
- 身份、权限、审批连续性
- 闭环债务台账
- 阻断强结论的未知项

### 3. `closed-loop-requirement-drift`

只在已实现闭环审计存在后使用。

它把一个具体新需求、PRD、功能提案、流程变化或产品设计，放到当前已审计基线之上评估。

它会回答：

- 新需求是否沿用已有事实源？
- 是否引入重复录入或平行事实？
- 是否能修复一个已知断裂闭环？
- 是否污染身份、权限、审批、报表、工作流或运维连续性？

主要输出包括：

- 已导入的闭环审计基线
- 需求边界
- 既有闭环保留/修复评分表
- 事实源影响图
- 闭环污染和漂移台账
- 变更前后闭环流程图
- 修复计划和验收门槛
- 阻断问题

## 推荐工作流

按顺序运行：

```text
legacy-system-archaeology
        ↓
implemented-closed-loop-audit
        ↓
closed-loop-requirement-drift
```

不要从代码直接跳到需求漂移评估。第三个 Skill 需要第二个 Skill 的审计基线。

## 示例提示词

纯考古：

```text
Use legacy-system-archaeology on this repository. Only document implemented code, tests, migrations, scripts, configuration, and runtime evidence. Do not evaluate new requirements or produce work-package plans.
```

已实现闭环审计：

```text
Use implemented-closed-loop-audit based on the archaeology report at <path>. Audit whether the implemented system satisfies 就源输入、多次应用、环环相扣、相互稽核. Do not use PRDs or future requirements.
```

需求漂移评估：

```text
Use closed-loop-requirement-drift based on the implemented closed-loop audit at <path> and the requirement file at <path>. Evaluate whether the requirement preserves, repairs, or pollutes the current closed-loop design.
```

## 适合场景

LoopLens 适合这些系统：

- 遗留代码多、文档弱
- 涉及核算、审计、合规、工作流或报表链路
- 有多个数据录入入口
- 依赖人工表格、文件导入或导出
- 权限、审批或数据范围复杂
- 正在准备迁移、重写或产品重构
- 经常混淆“已实现事实”和“未来想要的行为”

## 不适合场景

LoopLens 不适合：

- 单行 bug 修复
- 很窄的组件评审
- 前端视觉走查
- 泛泛的产品头脑风暴
- 需要攻击建模的安全审计
- 在当前事实未建立前直接做实施规划

## 安装

把 `skills/` 下的三个目录复制到你的 Codex skills 目录：

```bash
cp -R skills/legacy-system-archaeology ~/.codex/skills/
cp -R skills/implemented-closed-loop-audit ~/.codex/skills/
cp -R skills/closed-loop-requirement-drift ~/.codex/skills/
```

重启 Codex 或开启新会话，让 Skill 被重新发现。

## 校验

运行：

```bash
./scripts/validate-skills.sh
```

脚本会检查：

- 每个 Skill 都有有效的 `SKILL.md`
- 必要 frontmatter 存在
- 每个 Skill 都要求本地化读者摘要
- 没有常见本地/私有项目词
- 没有生成报告或运行快照混入仓库

## 希望收到的反馈

欢迎提交 issue，尤其是这些情况：

- Skill 把当前态考古和新需求评审混在一起
- Skill 过早生成工作包或修复计划
- Skill 把未来需求当成已实现事实
- Skill 漏掉重复事实源风险
- Skill 过拟合某个行业、系统或框架
- 报告太浅，不能支撑下一步工作
- 读者摘要缺失、太技术化或语言不对

有用的反馈包括：

- 你测试的项目类型
- 使用了哪个 Skill
- 哪个输出章节发生漂移
- 一小段脱敏后的输出片段
- 你期望 Skill 做什么

## 仓库原则

这个仓库只放可复用 Skill 和公开文档。

不要提交：

- 客户或内部生成报告
- 交接文件
- 运行快照
- 日志
- 本地绝对路径
- 凭据或私有 URL
- 公司、客户、项目特定证据

## 许可证

MIT。
