// Copyright (c) 2014, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Defines the AST model. The AST (Abstract Syntax Tree) model describes the
/// syntactic (as opposed to semantic) structure of Dart code. The semantic
/// structure of the code is modeled by the
/// [element model](../dart_element_element/dart_element_element-library.html).
///
/// An AST consists of nodes (instances of a subclass of [AstNode]). The nodes
/// are organized in a tree structure in which the children of a node are the
/// smaller syntactic units from which the node is composed. For example, a
/// binary expression consists of two sub-expressions (the operands) and an
/// operator. The two expressions are represented as nodes. The operator is not
/// represented as a node.
///
/// The AST is constructed by the parser based on the sequence of tokens
/// produced by the scanner. Most nodes provide direct access to the tokens used
/// to build the node. For example, the token for the operator in a binary
/// expression can be accessed from the node representing the binary expression.
///
/// While any node can theoretically be the root of an AST structure, almost all
/// of the AST structures known to the analyzer have a [CompilationUnit] as the
/// root of the structure. A compilation unit represents all of the Dart code in
/// a single file.
///
/// An AST can be either unresolved or resolved. When an AST is unresolved
/// certain properties will not have been computed and the accessors for those
/// properties will return `null`. The documentation for those getters should
/// describe that this is a possibility.
///
/// When an AST is resolved, the identifiers in the AST will be associated with
/// the elements that they refer to and every expression in the AST will have a
/// type associated with it.
library;

import 'package:analyzer/src/dart/ast/ast.dart';

export 'package:analyzer/src/dart/ast/ast.dart'
    show
        AdjacentStrings,
        AnnotatedNode,
        Annotation,
        ArgumentList,
        AsExpression,
        AssertInitializer,
        Assertion,
        AssertStatement,
        AssignedVariablePattern,
        AssignmentExpression,
        AstNode,
        AstVisitor,
        AugmentationImportDirective,
        AugmentedExpression,
        AugmentedInvocation,
        AwaitExpression,
        BinaryExpression,
        Block,
        BlockFunctionBody,
        BooleanLiteral,
        BreakStatement,
        CascadeExpression,
        CaseClause,
        CastPattern,
        CatchClause,
        CatchClauseParameter,
        ClassDeclaration,
        ClassMember,
        ClassTypeAlias,
        CollectionElement,
        Combinator,
        Comment,
        CommentReferableExpression,
        CommentReference,
        CompilationUnit,
        CompilationUnitMember,
        CompoundAssignmentExpression,
        ConditionalExpression,
        Configuration,
        ConstantPattern,
        ConstructorDeclaration,
        ConstructorFieldInitializer,
        ConstructorInitializer,
        ConstructorName,
        ConstructorReference,
        ConstructorReferenceNode,
        ConstructorSelector,
        ContinueStatement,
        DartPattern,
        Declaration,
        DeclaredIdentifier,
        DeclaredVariablePattern,
        DefaultFormalParameter,
        Directive,
        DoStatement,
        DottedName,
        DoubleLiteral,
        EmptyFunctionBody,
        EmptyStatement,
        EnumConstantArguments,
        EnumConstantDeclaration,
        EnumDeclaration,
        ExportDirective,
        Expression,
        ExpressionFunctionBody,
        ExpressionStatement,
        ExtendsClause,
        ExtensionDeclaration,
        ExtensionOnClause,
        ExtensionOverride,
        ExtensionTypeDeclaration,
        FieldDeclaration,
        FieldFormalParameter,
        ForEachParts,
        ForEachPartsWithDeclaration,
        ForEachPartsWithIdentifier,
        ForEachPartsWithPattern,
        ForElement,
        ForLoopParts,
        FormalParameter,
        FormalParameterList,
        ForParts,
        ForPartsWithDeclarations,
        ForPartsWithExpression,
        ForPartsWithPattern,
        ForStatement,
        FunctionBody,
        FunctionDeclaration,
        FunctionDeclarationStatement,
        FunctionExpression,
        FunctionExpressionInvocation,
        FunctionReference,
        FunctionTypeAlias,
        FunctionTypedFormalParameter,
        GenericFunctionType,
        GenericTypeAlias,
        GuardedPattern,
        HideCombinator,
        Identifier,
        IfElement,
        IfStatement,
        ImplementsClause,
        ImplicitCallReference,
        ImportDirective,
        ImportPrefixReference,
        IndexExpression,
        InstanceCreationExpression,
        IntegerLiteral,
        InterpolationElement,
        InterpolationExpression,
        InterpolationString,
        InvocationExpression,
        IsExpression,
        Label,
        LabeledStatement,
        LibraryAugmentationDirective,
        LibraryDirective,
        LibraryIdentifier,
        ListLiteral,
        ListPattern,
        ListPatternElement,
        Literal,
        LogicalAndPattern,
        LogicalOrPattern,
        MapLiteralEntry,
        MapPattern,
        MapPatternElement,
        MapPatternEntry,
        MethodDeclaration,
        MethodInvocation,
        MethodReferenceExpression,
        MixinDeclaration,
        MixinOnClause,
        NamedCompilationUnitMember,
        NamedExpression,
        NamedType,
        NamespaceDirective,
        NativeClause,
        NativeFunctionBody,
        NodeList,
        NormalFormalParameter,
        NullAssertPattern,
        NullCheckPattern,
        NullLiteral,
        NullShortableExpression,
        ObjectPattern,
        // ignore:deprecated_member_use_from_same_package
        OnClause,
        ParenthesizedExpression,
        ParenthesizedPattern,
        PartDirective,
        PartOfDirective,
        PatternAssignment,
        PatternField,
        PatternFieldName,
        PatternVariableDeclaration,
        PatternVariableDeclarationStatement,
        PostfixExpression,
        PrefixedIdentifier,
        PrefixExpression,
        PropertyAccess,
        RecordLiteral,
        RecordPattern,
        RecordTypeAnnotation,
        RecordTypeAnnotationField,
        RecordTypeAnnotationNamedField,
        RecordTypeAnnotationNamedFields,
        RecordTypeAnnotationPositionalField,
        RedirectingConstructorInvocation,
        RelationalPattern,
        RepresentationConstructorName,
        RepresentationDeclaration,
        RestPatternElement,
        RethrowExpression,
        ReturnStatement,
        ScriptTag,
        SetOrMapLiteral,
        ShowCombinator,
        SimpleFormalParameter,
        SimpleIdentifier,
        SimpleStringLiteral,
        SingleStringLiteral,
        SpreadElement,
        Statement,
        StringInterpolation,
        StringLiteral,
        SuperConstructorInvocation,
        SuperExpression,
        SuperFormalParameter,
        SwitchCase,
        SwitchDefault,
        SwitchExpression,
        SwitchExpressionCase,
        SwitchMember,
        SwitchPatternCase,
        SwitchStatement,
        SymbolLiteral,
        ThisExpression,
        ThrowExpression,
        TopLevelVariableDeclaration,
        TryStatement,
        TypeAlias,
        TypeAnnotation,
        TypeArgumentList,
        TypedLiteral,
        TypeLiteral,
        TypeParameter,
        TypeParameterList,
        UriBasedDirective,
        VariableDeclaration,
        VariableDeclarationList,
        VariableDeclarationStatement,
        VariablePattern,
        WhenClause,
        WhileStatement,
        WildcardPattern,
        WithClause,
        YieldStatement;

@Deprecated('This class was removed, use ClassDeclaration instead')
typedef ClassOrAugmentationDeclaration = ClassDeclaration;

@Deprecated('This class was removed, use MixinDeclaration instead')
typedef MixinOrAugmentationDeclaration = MixinDeclaration;
