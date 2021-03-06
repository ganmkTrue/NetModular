import WebHost from 'nm-module-admin'
import Common from 'nm-module-common'
import PersonnelFiles from 'nm-module-personnelfiles'
import CodeGenerator from 'nm-module-code-generator'
import config from './config'

// 注入模块
WebHost.addModule(Common)
WebHost.addModule(PersonnelFiles)
WebHost.addModule(CodeGenerator)

// 启动
WebHost.start(config)
