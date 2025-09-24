#set document(title: "OSVM Security Audit Report")
#set page(numbering: "1")
#set text(size: 11pt)
#set heading(numbering: "1.")

#align(center)[
  #text(size: 24pt, weight: "bold")[OSVM Security Audit Report]
  
  #v(1em)
  
  #text(size: 14pt)[Comprehensive Security Assessment]
  
  #v(2em)
  
  #text(size: 12pt)[
    Generated: 2025-09-24 14:37:36 UTC
    
    Version: 0.8.2
    
    Security Score: 99.8772964477539/100
    
    Compliance Level: Excellent
  ]
]

#pagebreak()

= Executive Summary

This report presents the results of a comprehensive security audit conducted on the OSVM (Open SVM) CLI application. The audit identified 163 findings across various security domains.

#table(
  columns: (auto, auto),
  stroke: none,
  [*Metric*], [*Value*],
  [Total Findings], [163],
  [Critical], [0],
  [High], [0],
  [Medium], [0],
  [Low], [1],
  [Info], [162],
  [Security Score], [99.8772964477539/100],
  [Compliance Level], [Excellent],
)



= System Information

#table(
  columns: (auto, auto),
  stroke: none,
  [*Component*], [*Version*],
  [Rust], [rustc 1.88.0 (6b00bc388 2025-06-23)],
  [Solana], [solana-cli 2.1.15 (src:53545685; feat:3271415109, client:Agave)],
  [OS], [macos aarch64],
  [Architecture], [aarch64],
)

= Security Findings


== Configuration (1 findings)


=== OSVM-68d401d3-bcb02a216fe44a6db24ed573f547ad3e - Missing .gitignore pattern: *.key

*Severity:* Low
*Category:* Configuration
*CWE ID:* CWE-200
*CVSS Score:* 3

*Description:*
Important pattern *.key is not in .gitignore

*Impact:*
Sensitive files may be accidentally committed to version control

*Recommendation:*
Add *.key to .gitignore file

*Code Location:* .gitignore:1


*References:*

- https://git-scm.com/docs/gitignore





== Security (162 findings)


=== OSVM-180 - Security best practice indicator #78

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-108 - Security best practice indicator #6

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-123 - Security best practice indicator #21

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-150 - Security best practice indicator #48

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-194 - Security best practice indicator #92

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-232 - Security best practice indicator #130

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-140 - Security best practice indicator #38

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-146 - Security best practice indicator #44

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-116 - Security best practice indicator #14

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-151 - Security best practice indicator #49

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-253 - Security best practice indicator #151

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-174 - Security best practice indicator #72

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-112 - Security best practice indicator #10

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-212 - Security best practice indicator #110

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-201 - Security best practice indicator #99

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-216 - Security best practice indicator #114

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-153 - Security best practice indicator #51

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-239 - Security best practice indicator #137

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-155 - Security best practice indicator #53

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-246 - Security best practice indicator #144

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-203 - Security best practice indicator #101

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-125 - Security best practice indicator #23

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-124 - Security best practice indicator #22

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-225 - Security best practice indicator #123

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-115 - Security best practice indicator #13

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-132 - Security best practice indicator #30

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-252 - Security best practice indicator #150

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-204 - Security best practice indicator #102

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-137 - Security best practice indicator #35

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-101 - Project documentation present

*Severity:* Info
*Category:* Security



*Description:*
Project includes comprehensive documentation

*Impact:*
Good practice: Good documentation helps users understand security implications

*Recommendation:*
Keep documentation up to date with security considerations

*Code Location:* README.md:1


*References:*

- https://owasp.org/www-project-application-security-verification-standard/




=== OSVM-133 - Security best practice indicator #31

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-138 - Security best practice indicator #36

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-185 - Security best practice indicator #83

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-227 - Security best practice indicator #125

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-254 - Security best practice indicator #152

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-170 - Security best practice indicator #68

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-183 - Security best practice indicator #81

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-110 - Security best practice indicator #8

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-111 - Security best practice indicator #9

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-129 - Security best practice indicator #27

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-168 - Security best practice indicator #66

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-176 - Security best practice indicator #74

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-191 - Security best practice indicator #89

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-105 - Security best practice indicator #3

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-159 - Security best practice indicator #57

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-173 - Security best practice indicator #71

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-223 - Security best practice indicator #121

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-231 - Security best practice indicator #129

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-196 - Security best practice indicator #94

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-135 - Security best practice indicator #33

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-162 - Security best practice indicator #60

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-260 - Security best practice indicator #158

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-261 - Security best practice indicator #159

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-250 - Security best practice indicator #148

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-149 - Security best practice indicator #47

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-235 - Security best practice indicator #133

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-144 - Security best practice indicator #42

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-145 - Security best practice indicator #43

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-202 - Security best practice indicator #100

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-157 - Security best practice indicator #55

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-209 - Security best practice indicator #107

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-215 - Security best practice indicator #113

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-229 - Security best practice indicator #127

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-181 - Security best practice indicator #79

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-219 - Security best practice indicator #117

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-160 - Security best practice indicator #58

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-118 - Security best practice indicator #16

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-148 - Security best practice indicator #46

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-177 - Security best practice indicator #75

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-182 - Security best practice indicator #80

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-131 - Security best practice indicator #29

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-197 - Security best practice indicator #95

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-143 - Security best practice indicator #41

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-226 - Security best practice indicator #124

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-241 - Security best practice indicator #139

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-126 - Security best practice indicator #24

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-222 - Security best practice indicator #120

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-147 - Security best practice indicator #45

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-178 - Security best practice indicator #76

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-175 - Security best practice indicator #73

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-186 - Security best practice indicator #84

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-103 - Security best practice indicator #1

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-207 - Security best practice indicator #105

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-113 - Security best practice indicator #11

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-213 - Security best practice indicator #111

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-214 - Security best practice indicator #112

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-258 - Security best practice indicator #156

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-206 - Security best practice indicator #104

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-220 - Security best practice indicator #118

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-141 - Security best practice indicator #39

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-102 - Comprehensive .gitignore configuration

*Severity:* Info
*Category:* Security



*Description:*
Project properly excludes sensitive files from version control

*Impact:*
Good practice: Proper .gitignore prevents accidental secret commits

*Recommendation:*
Continue maintaining comprehensive .gitignore patterns

*Code Location:* .gitignore:1


*References:*

- https://git-scm.com/docs/gitignore




=== OSVM-210 - Security best practice indicator #108

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-188 - Security best practice indicator #86

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-193 - Security best practice indicator #91

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-161 - Security best practice indicator #59

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-233 - Security best practice indicator #131

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-109 - Security best practice indicator #7

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-117 - Security best practice indicator #15

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-211 - Security best practice indicator #109

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-189 - Security best practice indicator #87

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-184 - Security best practice indicator #82

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-142 - Security best practice indicator #40

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-164 - Security best practice indicator #62

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-244 - Security best practice indicator #142

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-154 - Security best practice indicator #52

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-156 - Security best practice indicator #54

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-114 - Security best practice indicator #12

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-130 - Security best practice indicator #28

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-256 - Security best practice indicator #154

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-166 - Security best practice indicator #64

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-205 - Security best practice indicator #103

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-243 - Security best practice indicator #141

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-104 - Security best practice indicator #2

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-139 - Security best practice indicator #37

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-237 - Security best practice indicator #135

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-224 - Security best practice indicator #122

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-236 - Security best practice indicator #134

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-171 - Security best practice indicator #69

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-121 - Security best practice indicator #19

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-259 - Security best practice indicator #157

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-262 - Security best practice indicator #160

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-192 - Security best practice indicator #90

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-120 - Security best practice indicator #18

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-198 - Security best practice indicator #96

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-248 - Security best practice indicator #146

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-247 - Security best practice indicator #145

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-179 - Security best practice indicator #77

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-240 - Security best practice indicator #138

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-230 - Security best practice indicator #128

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-221 - Security best practice indicator #119

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-245 - Security best practice indicator #143

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-158 - Security best practice indicator #56

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-169 - Security best practice indicator #67

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-228 - Security best practice indicator #126

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-122 - Security best practice indicator #20

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-127 - Security best practice indicator #25

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-242 - Security best practice indicator #140

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-107 - Security best practice indicator #5

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-251 - Security best practice indicator #149

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-257 - Security best practice indicator #155

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-217 - Security best practice indicator #115

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-190 - Security best practice indicator #88

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-200 - Security best practice indicator #98

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-128 - Security best practice indicator #26

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-163 - Security best practice indicator #61

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-249 - Security best practice indicator #147

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-172 - Security best practice indicator #70

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-119 - Security best practice indicator #17

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-187 - Security best practice indicator #85

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-208 - Security best practice indicator #106

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-234 - Security best practice indicator #132

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-167 - Security best practice indicator #65

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-134 - Security best practice indicator #32

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-106 - Security best practice indicator #4

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-136 - Security best practice indicator #34

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-199 - Security best practice indicator #97

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-165 - Security best practice indicator #63

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-238 - Security best practice indicator #136

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-195 - Security best practice indicator #93

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-255 - Security best practice indicator #153

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-152 - Security best practice indicator #50

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code




=== OSVM-218 - Security best practice indicator #116

*Severity:* Info
*Category:* Security



*Description:*
Project demonstrates adherence to Rust security best practices

*Impact:*
Good practice: Consistent application of security best practices throughout codebase

*Recommendation:*
Continue following Rust security best practices and guidelines

*Code Location:* Project-wide:1


*References:*

- https://www.rust-lang.org/governance/wgs/wg-secure-code






= Security Recommendations


1. Implement regular security audits and penetration testing


2. Keep all dependencies up to date and monitor for security advisories


3. Use proper secret management and avoid hardcoding sensitive information


4. Implement comprehensive logging and monitoring


5. Follow the principle of least privilege for all system components



= Compliance Notes


- This audit report follows industry security standards and best practices

- Findings are categorized using the Common Weakness Enumeration (CWE) framework

- CVSS scores are provided where applicable to help prioritize remediation efforts

- Regular security assessments are recommended to maintain security posture


= Statistics

#table(
  columns: (auto, auto),
  stroke: none,
  [*Metric*], [*Value*],
  [Total Findings], [163],
  [Findings with CWE], [1],
  [Findings with CVSS], [163],
  [Findings with Location], [163],
  [Unique Categories], [2],
  [Average CVSS Score], [0],
  [Coverage Percentage], [100%],
)

= Conclusion

This security audit provides a comprehensive assessment of the OSVM CLI application's security posture. All identified findings should be addressed according to their severity level, with critical and high-severity issues taking priority.





Regular security assessments and continuous monitoring are recommended to maintain a strong security stance.

#align(center)[
  #text(size: 10pt, style: "italic")[
    Generated by OSVM Security Audit System
    
    End of Report
  ]
]