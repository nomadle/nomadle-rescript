open Vitest

// Test data types
type testUser = {
  id: string,
  email: string,
}

describe("Supabase", () => {
  test("createClient function should be defined", ctx => {
    ctx->expect(Supabase.createClient)->Expect.toBeTruthy
  })

  test("user type structure should be correct", ctx => {
    // Verify the user record type has the expected fields
    let mockUser: Supabase.user = {
      id: "test-id",
      aud: Some("authenticated"),
      role: Some("authenticated"),
      email: "test@example.com",
      email_confirmed_at: Some("2024-01-01"),
      phone: Some("+1234567890"),
      confirmation_sent_at: None,
      confirmed_at: Some("2024-01-01"),
      last_sign_in_at: Some("2024-01-01"),
      app_metadata: None,
      user_metadata: None,
      identities: None,
      created_at: Some("2024-01-01"),
      updated_at: Some("2024-01-01"),
      is_anonymous: Some(false),
    }
    
    ctx->expect(mockUser.id)->Expect.toBe("test-id")
    ctx->expect(mockUser.email)->Expect.toBe("test@example.com")
    ctx->expect(mockUser.is_anonymous)->Expect.toBe(Some(false))
  })

  test("session type structure should be correct", ctx => {
    let mockUser: Supabase.user = {
      id: "test-id",
      aud: Some("authenticated"),
      role: Some("authenticated"),
      email: "test@example.com",
      email_confirmed_at: None,
      phone: None,
      confirmation_sent_at: None,
      confirmed_at: None,
      last_sign_in_at: None,
      app_metadata: None,
      user_metadata: None,
      identities: None,
      created_at: None,
      updated_at: None,
      is_anonymous: None,
    }
    
    let mockSession: Supabase.session = {
      access_token: "mock-token",
      token_type: "bearer",
      expires_in: 3600,
      expires_at: 1234567890,
      refresh_token: "mock-refresh",
      user: mockUser,
    }
    
    ctx->expect(mockSession.access_token)->Expect.toBe("mock-token")
    ctx->expect(mockSession.expires_in)->Expect.toBe(3600)
    ctx->expect(mockSession.user.email)->Expect.toBe("test@example.com")
  })

  test("error type structure should be correct", ctx => {
    let mockError: Supabase.error = {
      message: "Test error",
      status: Some(400),
    }
    
    ctx->expect(mockError.message)->Expect.toBe("Test error")
    ctx->expect(mockError.status)->Expect.toBe(Some(400))
  })

  test("updateUserAttributes type should work", ctx => {
    let attrs: Supabase.updateUserAttributes = {
      "email": Some("new@example.com"),
      "password": None,
      "phone": None,
      "data": Some({
        "display_name": Some("Test User"),
        "avatar_url": None,
        "bio": None,
      }),
    }
    
    ctx->expect(attrs["email"])->Expect.toBe(Some("new@example.com"))
  })
})
